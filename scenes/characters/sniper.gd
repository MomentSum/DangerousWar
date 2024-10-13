extends Character


func _on_movement_ai_attack() -> void:
	if is_instance_valid(target):
		get_tree().get_first_node_in_group("game_camera").shake(3)
		%ProjectileLauncher.launch(target.position)
		create_tween().tween_property($CharacterSprite/SniperRifle, "position:x", 16, 0.4).from(6).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_SINE)
		
