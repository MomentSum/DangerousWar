extends Character

@export var origin_damage: int
@export var accelerated_damage: float

var damage: float


func _process(delta: float) -> void:
	$Laser.points[0] = %LaserOrigin.global_position - position
	
	if is_instance_valid(target) and $MovementAI.attacking:
		$Laser.points[1] = target.position - position
		damage += accelerated_damage * delta
	else:
		$Laser.points[1] = $Laser.points[0]


func _on_target_changed() -> void:
	damage = origin_damage


func _on_movement_ai_attacking_began() -> void:
	damage = origin_damage


func _on_movement_ai_attack() -> void:
	if is_instance_valid(target) and $MovementAI.attacking:
		target.hurtbox.be_attacked(damage as int, 1)
