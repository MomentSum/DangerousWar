extends ThrowableProjectile


func _ready() -> void:
	super()
	$ExplosionSpawner.character = character


func _process(delta: float) -> void:
	super(delta)
	rotation = sprite_rotation


func _on_dropped() -> void:
	$ExplosionSpawner.spawn()
