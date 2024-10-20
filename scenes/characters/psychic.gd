extends Character


@export var game_max_ghost_count: int
@export var ghost_scene: PackedScene
@export var summon_ghost_count: int

func _on_summon_timer_timeout() -> void:
	if get_tree().get_nodes_in_group(team_group + "_ghost").size() >= game_max_ghost_count:
		return
	for i in range(summon_ghost_count):
		var ghost = ghost_scene.instantiate()
		ghost.position = position
		ghost.team_index = team_index
		ghost.add_to_group(team_group + "_ghost")
		get_tree().get_first_node_in_group("characters_space").add_child(ghost)
