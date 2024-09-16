extends ThrowableProjectile

func _process(delta: float) -> void:
	super(delta)
	rotation = sprite_rotation


func _on_hitbox_hit() -> void:
	$Hitbox.disabled = true


func _on_dropped() -> void:
	$Hitbox.disabled = false
