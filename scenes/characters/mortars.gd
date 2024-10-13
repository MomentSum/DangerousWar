extends Character



func _on_movement_ai_attack() -> void:
	if is_instance_valid(target):
		%ProjectileLauncher.launch(target.position)
		create_tween().tween_property(%MortarsBarrel, "position", Vector2(13, -8), 0.4)\
				.from(Vector2(8, -2))\
				.set_ease(Tween.EASE_OUT)\
				.set_trans(Tween.TRANS_SINE)
