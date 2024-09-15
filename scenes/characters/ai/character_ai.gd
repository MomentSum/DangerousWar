extends Node2D

class_name CharacterAI

signal attack()


@export var attack_distance: float

@export var attack_wait: float
@export var refind_target_wait: float = 0.1
@export var character: Character

var target: Character



var _direction_to_target: Vector2:
	get:
		if not is_instance_valid(target):
			return Vector2.ZERO
		return character.position.direction_to(target.position)

var _distance_to_target: float:
	get:
		if not is_instance_valid(target):
			return 1e+10
		return character.position.distance_to(target.position)


func _ready() -> void:
	$RefindTargetTimer.wait_time = refind_target_wait
	$AttackTimer.wait_time = attack_wait
	get_tree().process_frame.connect(find_target,CONNECT_ONE_SHOT)


func _process(delta: float) -> void:
	if is_instance_valid(target):
		character.set_sprite_rotation(character.position.direction_to(target.position).angle())
	if _distance_to_target < attack_distance:
		if $AttackTimer.time_left == 0:
			$AttackTimer.start()
			_on_attack_timer_timeout()
	else:
		$AttackTimer.stop()


func find_target() -> void:
	var characters := get_tree().get_nodes_in_group("character")
	var nearest_enemy: Character
	var min_adistance: float = 1e+10
	for c: Character in characters:
		if c.is_in_group(character.team_group):
			continue
		var distance = character.position.distance_to(c.position)
		var adistance = distance / character.aggression_multiple
		if c == target:
			adistance *= 0.8
			pass
		if adistance < min_adistance:
			nearest_enemy = c
			min_adistance = adistance
	target = nearest_enemy


func _on_refind_target_timer_timeout() -> void:
	find_target()


func _on_attack_timer_timeout() -> void:
	attack.emit()
