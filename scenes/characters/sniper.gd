extends Character


func _on_movement_ai_attack() -> void:
	if is_instance_valid(target):
		get_tree().get_first_node_in_group("game_camera").shake(3)
		%ProjectileLauncher.launch(target.position)
