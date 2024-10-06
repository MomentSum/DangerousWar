extends Node2D

@export var life_time: float

func _ready() -> void:
	rotation = randf_range(-PI, PI)
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, life_time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	tween.tween_callback(queue_free)
