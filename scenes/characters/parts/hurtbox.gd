extends Area2D

class_name Hurtbox

signal be_hurt(damage: int)
signal died()

@export var health: int
@export_range(0,1) var damage_resist: float
@export var character: Character


func be_attacked(damage: int, peneration_rate: float = 0) -> void:
	damage *= (1 - damage_resist) * (1 - peneration_rate)
	health = max(health - damage, 0)
	be_hurt.emit()
	if health <= 0:
		died.emit()
