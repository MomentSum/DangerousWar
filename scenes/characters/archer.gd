extends Character




func _on_movement_ai_attack() -> void:
	if position.distance_to(target.position) < $MovementAI.target_distance_min * 1.5:
		%LinearArrowLauncher.launch(target.position)
	else:
		%ArrowLauncher.launch(target.position)
