extends Node2D


@export var explosion_scene: PackedScene

@export var damage: float
@export var peneration_rate: float
@export var single_attack: bool
@export var show_effects: bool = true
@export var character: Character:
	set(new):
		character = new
		_team_index = character.team_index

var _team_index: int

func _ready() -> void:
	hide()


func spawn() -> void:
	var explosion = explosion_scene.instantiate()
	explosion.position = global_position
	explosion.scale = scale
	explosion.damage = damage
	explosion.peneration_rate = peneration_rate
	explosion.show_effects = show_effects
	explosion.single_attack = single_attack
	explosion.team_index = _team_index
	explosion.modulate = GameRunningData.teams_colors[_team_index]
	get_tree().get_first_node_in_group("characters_space").add_child(explosion)
