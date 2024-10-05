extends Projectile


@export var move_speed: float

func _ready() -> void:
	rotation = direction.angle()

func _process(delta: float) -> void:
	position += move_speed * direction * delta


func _on_hitbox_hit() -> void:
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
