extends Area2D

class_name Hitbox

signal hit

@export var damage: int

@export var single_attack: bool
@export var character: Character


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		if not is_instance_valid(character) or not area.character.is_in_group(character.team_group):
			area.be_attacked(damage)
			hit.emit()


func _on_hit() -> void:
	if single_attack:
		monitoring = false
