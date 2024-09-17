extends Projectile


@export var move_speed: float

func _ready() -> void:
	rotation = direction.angle()

func _process(delta: float) -> void:
	position += move_speed * direction * delta


func _on_hitbox_hit() -> void:
	queue_free()
