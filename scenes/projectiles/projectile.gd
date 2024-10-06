extends Node2D

class_name Projectile

var direction: Vector2
var target: Vector2
var character: Character


func _notification(what: int) -> void:
	match(what):
		NOTIFICATION_READY:
			$Hitbox.character = character
			modulate = GameRunningData.teams_colors[character.team_index]
