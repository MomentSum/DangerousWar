extends ThrowableProjectile

@export var rotate_speed: float


func _ready() -> void:
	super()
	$ExplosionSpawner.character = character


func _process(delta: float) -> void:
	super(delta)
	rotation += deg_to_rad(rotate_speed) * delta


func _on_dropped() -> void:
	$ExplosionSpawner.spawn()
