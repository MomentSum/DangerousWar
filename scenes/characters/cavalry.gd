extends Character


func _on_cavalry_ai_dashing_began() -> void:
	%Hitbox.disabled = false


func _on_cavalry_ai_dashing_ended() -> void:
	%Hitbox.disabled = true

func _process(delta: float) -> void:
	if is_instance_valid(target):
		if target.position.x < position.x:
			$Horse.scale.y = -$Horse.scale.x
			$Horse.rotation = PI
		else:
			$Horse.scale.y = $Horse.scale.x
			$Horse.rotation = 0
