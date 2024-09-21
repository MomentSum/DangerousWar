extends Projectile

class_name ThrowableProjectile


signal dropped()


@export var time: float
@export var height: float

var sprite_rotation: float

var _origin: Vector2
var _ending: Vector2
var _control :Vector2

var _time: float
var _dropped: bool


func _ready() -> void:
	_origin = position
	_ending = target
	_control = Vector2.ZERO
	_control.x = lerpf(_origin.x, _ending.x, 0.5)
	_control.y = min(_origin.y, _ending.y) - height


func _process(delta: float) -> void:
	_time += delta
	var weight = _time / time
	var c1 = _origin.lerp(_control, weight)
	var c2 = _control.lerp(_ending, weight)
	var c = c1.lerp(c2, weight)
	sprite_rotation = position.direction_to(c).angle()
	position = c
	if not _dropped and weight > 0.95:
		dropped.emit()
		_dropped = true
	if weight > 1:
		queue_free()

