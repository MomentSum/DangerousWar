extends Area2D

class_name Character

signal be_hurt(damage: int, knockback: Vector2)
signal died()

@export var team_group: StringName

@export var health: int
@export var defense: int
@export var knockback_resist: float
@export var aggression_multiple: float = 1

@onready var sprite :Node2D = $Sprite

var target: Character

func _ready() -> void:
	if not team_group.is_empty():
		add_to_group(team_group)
	
	var color = get_tree().get_first_node_in_group(team_group+"_color")
	if is_instance_valid(color):
		sprite.modulate = color.modulate
	
	$HealthBar.max_value = health
	$HealthBar.value = health


func be_attacked(damage: int,knockback: Vector2 = Vector2.ZERO) -> void:
	damage *= randf_range(0.8,1.2)
	damage = max(damage - defense, 1)
	health = max(health - damage, 0)
	be_hurt.emit(damage, knockback)
	if health <= 0:
		died.emit()
		queue_free()
	knockback *= 1 - knockback_resist
	if knockback:
		pass
	
	$HealthBar.value = health

func set_sprite_rotation(new: float) -> void:
	if Vector2.from_angle(new).x < 0:
		sprite.scale.y = -scale.x
	else:
		sprite.scale.y = scale.x
	sprite.rotation = new
