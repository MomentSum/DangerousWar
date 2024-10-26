extends Character

@export var damage: int

func _on_movement_ai_attack() -> void:
	if is_instance_valid(target):
		target.hurtbox.be_attacked(damage, 1)
