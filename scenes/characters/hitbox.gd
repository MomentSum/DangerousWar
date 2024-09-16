extends Area2D

class_name Hitbox

signal hit

@export var damage: int
@export var disabled: bool

@export var character: Character


func _on_hitbox_area_entered(area: Area2D) -> void:
	if disabled:
		return
	if area is Hurtbox:
		if not is_instance_valid(character) or not area.character.is_in_group(character.team_group):
			area.be_attacked(damage)
			hit.emit()

