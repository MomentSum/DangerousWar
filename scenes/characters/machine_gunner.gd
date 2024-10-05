extends Character


func _on_movement_ai_attack() -> void:
	%ProjectileLauncher.launch(target.position)
