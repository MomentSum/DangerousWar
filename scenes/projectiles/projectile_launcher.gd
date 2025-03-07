extends Node2D


@export var character: Character
@export var projectile_scene: PackedScene
@export var audio : AudioStream
@export var volume_db: float


func launch(target: Vector2, direction: Vector2 = character.position.direction_to(target)) -> void:
	var projectile = projectile_scene.instantiate() as Projectile
	projectile.position = global_position
	projectile.target = target
	projectile.character = character
	projectile.direction = direction
	AudioManager.play_2d(audio, position, volume_db)
	get_tree().get_first_node_in_group("projectiles_space").add_child(projectile)
