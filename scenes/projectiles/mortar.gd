extends ThrowableProjectile

func _ready() -> void:
	super()
	$ExplosionSpawner.character = character


func _on_dropped() -> void:
	$ExplosionSpawner.spawn()
