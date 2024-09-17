extends Character


func _on_movement_ai_attack() -> void:
	$Hitbox.monitoring = true
	$Timer.start()
	$CharacterSprite.hide()
	hurtbox.defense = 1e+10

func _on_timer_timeout() -> void:
	$Hitbox.monitoring = false


func _on_movement_ai_attacking_began() -> void:
	$Anim.play("boom")


func _on_movement_ai_attacking_ended() -> void:
	if $Timer.time_left == 0:
		$Anim.play("RESET")
