extends Area2D

class_name Hitbox

signal hit

@export var damage: int

@export_range(0,1) var peneration_rate: float
@export var single_attack: bool
@export var character: Character


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		if not is_instance_valid(character) or not area.character.team_index == character.team_index:
			area.be_attacked(damage, peneration_rate)
			hit.emit()


func _on_hit() -> void:
	if single_attack:
		set_deferred("monitoring", false)
