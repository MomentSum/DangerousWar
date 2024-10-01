extends Character


func _on_cavalry_ai_dashing_began() -> void:
	%Hitbox.monitoring = true


func _on_cavalry_ai_dashing_ended() -> void:
	%Hitbox.monitoring = false


func _process(delta: float) -> void:
	if is_instance_valid(target):
		if character_sprite.scale.y < 0:
			$Horse.scale.y = -$Horse.scale.x
			$Horse.rotation = PI
		else:
			$Horse.scale.y = $Horse.scale.x
			$Horse.rotation = 0
