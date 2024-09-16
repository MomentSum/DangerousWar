extends Node2D

class_name CharacterSprite


@export var character: Character


var rotation_offset: float
var _transition_rotation_offset: float


func _ready() -> void:
	get_tree().process_frame.connect(func():
		$HealthBar.max_value = character.hurtbox.health
		character.target_changed.connect(_on_character_target_changed)
		var color = get_tree().get_first_node_in_group(character.team_group+"_color")
		if is_instance_valid(color):
			modulate = color.modulate
	,CONNECT_ONE_SHOT)


func _on_character_target_changed() -> void:
	if is_instance_valid(character.target):
		var new_direction = character.position.direction_to(character.target.position)
		_transition_rotation_offset = - Vector2.from_angle(rotation).angle_to(new_direction)
		create_tween().tween_property(self,"_transition_rotation_offset", 0, 0.3)


func _process(delta: float) -> void:
	if is_instance_valid(character.target):
		rotation = \
				character.position.direction_to(character.target.position).angle() \
				+ rotation_offset \
				+ _transition_rotation_offset 
	$HealthBar.rotation = - rotation
	$HealthBar.value = character.hurtbox.health

