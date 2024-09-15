extends Character


func _on_movement_ai_attack() -> void:
	%ProjectileLauncher.launch(Vector2.from_angle(sprite.rotation),$MovementAI.target.position)
