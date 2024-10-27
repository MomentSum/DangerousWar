extends Node2D

@export var damage: int
@export var peneration_rate: float
@export var squared_raduis: int
@export var team_index: int
@export var single_attack: bool
@export var show_effects: bool

@export var audio: AudioStream


func _ready() -> void:
	for c: Character in get_tree().get_nodes_in_group("character"):
		if c.team_index == team_index:
			continue
		if c.position.distance_squared_to(position) <= squared_raduis * scale.x * scale.x:
			c.hurtbox.be_attacked(damage, peneration_rate)
			if single_attack:
				return
	if show_effects:
		AudioManager.play_2d(audio, position, -10)
		get_tree().get_first_node_in_group("game_camera").shake(5)
