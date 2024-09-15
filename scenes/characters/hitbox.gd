extends Area2D

class_name Hitbox

signal hit

@export var damage: int
@export var knockback: int
@export var character: Character
@export var disabled: bool


func _on_hitbox_area_entered(area: Area2D) -> void:
	if disabled:
		return
	if area is Character:
		if not is_instance_valid(character) or not area.is_in_group(character.team_group):
			var direction = global_position.direction_to(area.position)
			area.be_attacked(damage, knockback*direction)
			hit.emit()

