extends Control


func _ready() -> void:
	var tween  = create_tween()
	tween.tween_property($Image, "modulate:a", 1, 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_property($Image, "modulate:a", 0, 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN).set_delay(1)
	tween.tween_callback(func():
		get_tree().change_scene_to_file("res://scenes/title.tscn")
	)
