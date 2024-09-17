extends Character


func _on_movement_ai_attack() -> void:
	$Hitbox.monitoring = true
	$Timer.start()
	hurtbox.defense = 1e+10

func _on_timer_timeout() -> void:
	queue_free()


func _on_movement_ai_attacking_began() -> void:
	$Anim.play("boom")


func _on_movement_ai_attacking_ended() -> void:
	$Anim.play("RESET")
