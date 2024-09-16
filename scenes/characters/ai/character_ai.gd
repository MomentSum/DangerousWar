extends Node2D

class_name CharacterAI

@export var refind_target_wait: float = 0.1
@export var character: Character


var target: Character:
	get:
		return character.target


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
