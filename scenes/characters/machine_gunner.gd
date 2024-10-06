extends Character


func _on_movement_ai_attack() -> void:
	get_tree().get_first_node_in_group("game_camera").shake(0.5)
	%ProjectileLauncher.launch(target.position)
