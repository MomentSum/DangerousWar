extends Node2D


@export var explosion_scene: PackedScene

@export var damage: float
@export var peneration_rate: float
@export var character: Character


func _ready() -> void:
	hide()


func spawn() -> void:
	var explosion = explosion_scene.instantiate()
	explosion.position = global_position
	explosion.scale = scale
	explosion.damage = damage
	explosion.peneration_rate = peneration_rate
	explosion.character = character
	explosion.modulate = get_tree().get_first_node_in_group(character.team_group + "_color").modulate
	get_tree().get_first_node_in_group("characters_space").add_child(explosion)
