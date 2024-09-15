extends CharacterAI


class_name MovementAI

@export var target_distance_min: float
@export var teammate_away_distance_max: float
@export var teammate_away_weight_max: float = 1
@export var move_speed: float


func _ready() -> void:
	super()
	%Coll.shape.radius = teammate_away_distance_max


func _process(delta: float) -> void:
	super(delta)
	var weighted_direction_away_from_teammate = get_weighted_direction_away_from_teammate()
	var direction_follow_target = get_direction_follow_target()
	var direction = (weighted_direction_away_from_teammate + direction_follow_target).normalized()
	character.position += direction * move_speed * delta


func get_direction_follow_target() -> Vector2:
	if is_instance_valid(target):
		if _distance_to_target > attack_distance:
			return _direction_to_target
		if _distance_to_target < target_distance_min:
			return -_direction_to_target
	return Vector2.ZERO


func get_weighted_direction_away_from_teammate() -> Vector2:
	var wdirection: Vector2
	for area in $Area2D.get_overlapping_areas():
		if area is Character and area.is_in_group(character.team_group):
			var distance = area.position.distance_to(character.position)
			var weight = max(1- distance / teammate_away_distance_max, 0)
			var direction = area.position.direction_to(character.position)
			wdirection += direction * weight
	return wdirection

