extends Node2D

class_name Character


signal target_changed

@export var team_group: StringName
@export var aggression_multiple: float = 1

@onready var hurtbox: Hurtbox = $Hurtbox

var target: Character

func _ready() -> void:
	if not team_group.is_empty():
		add_to_group(team_group)
	
	get_tree().process_frame.connect(find_target,CONNECT_ONE_SHOT)


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
	if target != nearest_enemy:
		target = nearest_enemy
		target_changed.emit()

func _on_refind_target_timer_timeout() -> void:
	find_target()


func _on_target_changed() -> void:
	#if modulate.a == 1:
		#modulate.a = 0.5
	#else:
		#modulate.a = 1
	pass
