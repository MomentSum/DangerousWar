extends CharacterAI


signal dashing_began
signal dashing_ended


@export var keep_distance_min: float
@export var keep_distance_max: float
@export var move_speed: float
@export var extra_dash_distance_min: float
@export var dash_wait: float
@export var dash_speed: float


var _clockwise_rotation: float

var _dashing: float
var _dash_direction: Vector2
var _be_touched: bool

var _attacking: bool:
	set(new):
		if _attacking == new:
			return 
		_attacking = new
		if _attacking:
			$DashTimer.start()
		else:
			$DashTimer.stop()


func _ready() -> void:
	$DashTimer.wait_time = dash_wait
	get_tree().process_frame.connect(func():
		character.hurtbox.area_entered.connect(func(area: Area2D):
			if area is Hurtbox:
				var c = area.character as Character
				if not c.is_in_group(character.team_group):
					_be_touched = true
					if _dashing and c.is_in_group("armoured"):
						_dash_direction *= -0.5
						area.be_attacked(area.health/4, 1)
		)
		_clockwise_rotation = -1 if randi_range(0,1) == 0 else 1
	,CONNECT_ONE_SHOT)


func _process(delta: float) -> void:
	if _dashing:
		character.position += _dash_direction * dash_speed * delta
		return
	
	if not is_instance_valid(target):
		return
	
	if character.distance_to_target > keep_distance_max:
		var angle = asin(keep_distance_max / character.distance_to_target)
		var direction = character.direction_to_target.rotated(-_clockwise_rotation*angle)
		character.position += direction * move_speed * delta
		_attacking = false
	else:
		var vec = character.position - target.position
		var arc = move_speed * delta
		var angle = arc / character.distance_to_target
		var result_vec = vec.rotated(_clockwise_rotation * angle)
		var direction = vec.direction_to(result_vec)
		if character.distance_to_target < keep_distance_min:
			direction = (direction - character.direction_to_target ) / 2
		character.position += direction * move_speed * delta
		_attacking = true


func _on_dashing_check_timer_timeout() -> void:
	if _be_touched:
		_be_touched = false
	else:
		$DashingCheckTimer.stop()
		_dashing = false
		dashing_ended.emit()
		$DashTimer.start()
		character.refind_target_enabled = true
		character.character_sprite.rotate_enabled = true
		_clockwise_rotation *= -1


func _on_dash_timer_timeout() -> void:
	if not is_instance_valid(target):
		return
	_dashing = true
	dashing_began.emit()
	_dash_direction = character.direction_to_target
	character.refind_target_enabled = false
	character.character_sprite.rotate_enabled = false
	await get_tree().create_timer( \
			(character.distance_to_target + extra_dash_distance_min) / dash_speed).timeout
	$DashingCheckTimer.start()
