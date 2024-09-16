extends Node2D

class_name CharacterSprite


@export var character: Character

@export var rotation_offset: float

var rotate_enabled: bool = true

var _transition_rotation_offset: float


func _ready() -> void:
	get_tree().process_frame.connect(func():
		$HealthBar.max_value = character.hurtbox.health
		character.target_changed.connect(_on_character_target_changed)
	,CONNECT_ONE_SHOT)


func _on_character_target_changed() -> void:
	if is_instance_valid(character.target):
		var new_direction = character.position.direction_to(character.target.position)
		_transition_rotation_offset = new_direction.angle_to(Vector2.from_angle(rotation))
		create_tween().tween_property(self,"_transition_rotation_offset", 0, 0.3)
		if new_direction.x < 0:
			scale.y = -scale.x
		else:
			scale.y = scale.x
		#if new_direction.x < 0:
			#create_tween().tween_property(self,"scale:y", -scale.x, 0.3)
		#else:
			#create_tween().tween_property(self,"scale:y", scale.x, 0.3)


func _process(delta: float) -> void:
	if rotate_enabled:
		if is_instance_valid(character.target):
			rotation = \
					character.position.direction_to(character.target.position).angle() \
					+ rotation_offset \
					+ _transition_rotation_offset 
		$HealthBar.rotation = -rotation
	$HealthBar.value = character.hurtbox.health

