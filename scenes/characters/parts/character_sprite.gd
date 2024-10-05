extends Node2D

class_name CharacterSprite


@export var character: Character
@export var rotation_offset: float
@export var rotate_enabled: bool = true

var _transition_rotation_offset: float


func _ready() -> void:
	get_tree().process_frame.connect(func():
		$HealthBar.max_value = character.hurtbox.health
		character.target_changed.connect(_on_character_target_changed)
	,CONNECT_ONE_SHOT)


func _on_character_target_changed() -> void:
	if is_instance_valid(character.target):
		transition_rotation()
		if character.direction_to_target.x < 0:
			scale.y = -scale.x
			$HealthBar.scale.y = -$HealthBar.scale.x
			if not rotate_enabled:
				rotation = PI
		else:
			scale.y = scale.x
			$HealthBar.scale.y = $HealthBar.scale.x
			if not rotate_enabled:
				rotation = 0


func _process(delta: float) -> void:
	if rotate_enabled:
		if is_instance_valid(character.target):
			rotation = \
					character.direction_to_target.angle() \
					+ sign($HealthBar.scale.y) * deg_to_rad(rotation_offset) \
					+ _transition_rotation_offset
	$HealthBar.rotation = - sign($HealthBar.scale.y) * rotation
	$HealthBar.value = character.hurtbox.health


func transition_rotation(from_direction: Vector2 = Vector2.from_angle(rotation)) -> void:
	var direction = character.direction_to_target
	_transition_rotation_offset = direction.angle_to(from_direction)
	create_tween().tween_property(self,"_transition_rotation_offset", 0, 0.3)
