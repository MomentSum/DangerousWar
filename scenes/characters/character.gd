extends Node2D

class_name Character


signal target_changed

@export var team_index: int
@export var aggression_multiple: float = 1
@export var refind_target_wait: float
@export var castle_damage: int = 10


@onready var hurtbox: Hurtbox = $Hurtbox
@onready var character_sprite: CharacterSprite = $CharacterSprite

var team_group: StringName

var viewport_size: Vector2:
	get:
		return Vector2(ProjectSettings.get_setting("display/window/size/viewport_width") \
				,ProjectSettings.get_setting("display/window/size/viewport_height"))


var direction_to_target: Vector2:
	get:
		if not is_instance_valid(target):
			return Vector2.ZERO
		return position.direction_to(target.position)

var distance_to_target: float:
	get:
		if not is_instance_valid(target):
			return 1e+10
		return position.distance_to(target.position)


var refind_target_enabled: bool = true
var target: Character


func _ready() -> void:
	team_group = "team_%s" % team_index
	add_to_group(team_group)
	
	modulate = GameRunningData.teams_colors[team_index]
	get_tree().process_frame.connect(find_target,CONNECT_ONE_SHOT)
	$RefindTargetTimer.wait_time = refind_target_wait


func find_target() -> void:
	var characters := get_tree().get_nodes_in_group("character")
	var nearest_enemy: Character
	var min_adistance: float = 1e+10
	for c: Character in characters:
		if not is_instance_valid(c):
			continue
		if c.team_index == team_index:
			continue
		var distance = position.distance_to(c.position)
		var adistance = distance / c.aggression_multiple
		if c == target:
			adistance *= 0.8
			pass
		if adistance < min_adistance:
			nearest_enemy = c
			min_adistance = adistance
	if target != nearest_enemy:
		target = nearest_enemy
		target_changed.emit()

func _on_refind_target_timer_timeout() -> void:
	if refind_target_enabled:
		find_target()
	$RefindTargetTimer.start()


func _on_hurtbox_died() -> void:
	queue_free()


func _notification(what: int) -> void:
	if what == NOTIFICATION_PROCESS:
		position = position.clamp(Vector2.ZERO, viewport_size)
