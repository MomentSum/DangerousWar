extends Node2D

class_name Character


signal target_changed

@export var team_group: StringName
@export var aggression_multiple: float = 1

@onready var sprite :Node2D = $Sprite

var target: Character

func _ready() -> void:
	if not team_group.is_empty():
		add_to_group(team_group)
	
	var color = get_tree().get_first_node_in_group(team_group+"_color")
	if is_instance_valid(color):
		sprite.modulate = color.modulate
	
	get_tree().process_frame.connect(find_target,CONNECT_ONE_SHOT)


func set_sprite_rotation(new: float) -> void:
	if Vector2.from_angle(new).x < 0:
		sprite.scale.y = -scale.x
	else:
		sprite.scale.y = scale.x
	sprite.rotation = new


func _on_hurtbox_died() -> void:
	queue_free()


func find_target() -> void:
	var characters := get_tree().get_nodes_in_group("character")
	var nearest_enemy: Character
	var min_adistance: float = 1e+10
	for c: Character in characters:
		if c.is_in_group(team_group):
			continue
		var distance = position.distance_to(c.position)
		var adistance = distance / aggression_multiple
		if c == target:
			adistance *= 0.8
			pass
		if adistance < min_adistance:
			nearest_enemy = c
			min_adistance = adistance
	target = nearest_enemy


func _on_refind_target_timer_timeout() -> void:
	find_target()
