extends Area2D

class_name Hurtbox

signal be_hurt(damage: int)
signal died()

@export var health: int
@export var defense: int
@export var character: Character


func be_attacked(damage: int, peneration_rate: float = 0) -> void:
	damage = max(damage - defense * (1 - peneration_rate), 0)
	health = max(health - damage, 0)
	be_hurt.emit()
	if health <= 0:
		died.emit()
