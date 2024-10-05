extends Character



func _on_movement_ai_attack() -> void:
	if is_instance_valid(target):
		%ProjectileLauncher.launch(target.position)
