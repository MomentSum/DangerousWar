extends Node2D


@export var character: Character
@export var projectile_scene: PackedScene


func launch(direction: Vector2, target: Vector2) -> void:
	var projectile = projectile_scene.instantiate() as Projectile
	projectile.position = global_position
	projectile.target = target
	projectile.character = character
	projectile.direction = direction
	get_tree().get_first_node_in_group("projectiles_space").add_child(projectile)
