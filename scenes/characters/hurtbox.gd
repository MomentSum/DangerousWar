extends Area2D

class_name Hurtbox

signal be_hurt(damage: int)
signal died()

@export var health: int
@export var defense: int
@export var team_group: StringName


func be_attacked(damage: int) -> void:
	damage = max(damage - defense, 0)
	health = max(health - damage, 0)
	be_hurt.emit()
	if health <= 0:
		died.emit()
