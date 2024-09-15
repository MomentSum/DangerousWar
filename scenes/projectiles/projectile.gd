extends Node2D

class_name Projectile

var direction: Vector2
var target: Vector2
var character: Character


func _notification(what: int) -> void:
	match(what):
		NOTIFICATION_READY:
			$Hitbox.character = character


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
