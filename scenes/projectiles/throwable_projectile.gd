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
	if weight > 0.9:
		dropped.emit()
	if weight > 1:
		queue_free()

