extends Node2D

class_name Character

@export var team_group: StringName

@export var aggression_multiple: float = 1

@onready var sprite :Node2D = $Sprite

var target: Character

@onready var hurtbox: Hurtbox = $Hurtbox

func _ready() -> void:
	if not team_group.is_empty():
		hurtbox.team_group = team_group
		add_to_group(team_group)
	
	var color = get_tree().get_first_node_in_group(team_group+"_color")
	if is_instance_valid(color):
		sprite.modulate = color.modulate
	
	#$HealthBar.max_value = health
	#$HealthBar.value = health


func set_sprite_rotation(new: float) -> void:
	if Vector2.from_angle(new).x < 0:
		sprite.scale.y = -scale.x
	else:
		sprite.scale.y = scale.x
	sprite.rotation = new
