extends Character


func _on_cavalry_ai_dashing_began() -> void:
	%Hitbox.disabled = false


func _on_cavalry_ai_dashing_ended() -> void:
	%Hitbox.disabled = true
