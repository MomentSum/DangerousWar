extends Button


func _on_mouse_entered() -> void:
	pivot_offset = size / 2
	create_tween().tween_property(self, "scale", Vector2.ONE * 1.2, 0.08)


func _on_mouse_exited() -> void:
	create_tween().tween_property(self, "scale", Vector2.ONE, 0.08)
