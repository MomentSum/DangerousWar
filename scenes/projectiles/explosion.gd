extends Node2D

@export var damage: int
@export var peneration_rate: float
@export var character: Character
@export var squared_raduis: int

var team_group: StringName

func _ready() -> void:
	if not is_instance_valid(character):
		queue_free()
		return
	team_group = character.team_group
	for c: Character in get_tree().get_nodes_in_group("character"):
		if c.team_group == team_group:
			continue
		if c.position.distance_squared_to(position) <= squared_raduis * scale.x * scale.x:
			c.hurtbox.be_attacked(damage, peneration_rate)
