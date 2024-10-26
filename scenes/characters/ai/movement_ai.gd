extends CharacterAI


class_name MovementAI


signal attack()
signal attacking_began()
signal attacking_ended()



@export var target_distance_min: float = 16
@export var target_distance_max: float = 32
@export var teammate_away_distance_max: float = 36
@export var teammate_away_weight_max: float = 0.8
@export var move_speed_multiple: float = 1
@export var attack_wait: float = 1e+5
@export var attacking_speed_multiple: float = 0.5


var attacking: bool = false:
	set(new):
		if attacking == new:
			return
		attacking = new
		if new:
			attacking_began.emit()
			$AttackTimer.start()
		else:
			attacking_ended.emit()
			$AttackTimer.stop()


func _ready() -> void:
	%Coll.shape.radius = teammate_away_distance_max
	$AttackTimer.wait_time = attack_wait


func _process(delta: float) -> void:
	var weighted_direction_away_from_teammate = get_weighted_direction_away_from_teammate()
	var direction_follow_target = get_direction_follow_target()
	var direction = (weighted_direction_away_from_teammate + direction_follow_target).normalized()
	if attacking:
		direction *= attacking_speed_multiple
	character.position += direction * MOVE_SPEED * move_speed_multiple * delta
	character.position = character.position.clamp(Vector2.ZERO, character.viewport_size)
	attacking = character.distance_to_target <= target_distance_max


func get_direction_follow_target() -> Vector2:
	if is_instance_valid(target):
		if character.distance_to_target > target_distance_max:
			return character.direction_to_target
		#if character.distance_to_target < target_distance_min:
			#return -character.direction_to_target
	return Vector2.ZERO


func get_weighted_direction_away_from_teammate() -> Vector2:
	var wdirection: Vector2 = Vector2()
	for area in $Area2D.get_overlapping_areas():
		if area is Hurtbox and area.character.is_in_group(character.team_group):
			var teammate = area.character
			var distance = teammate.position.distance_to(character.position)
			var weight = max(1- distance / teammate_away_distance_max, 0)
			var direction = teammate.position.direction_to(character.position)
			wdirection += direction * weight
	return wdirection


func _on_attack_timer_timeout() -> void:
	attack.emit()
