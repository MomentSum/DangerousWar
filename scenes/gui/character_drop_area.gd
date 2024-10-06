extends TextureRect


class_name CharacterDropArea


signal character_dropped(position: Vector2)


var _drop_position: Vector2
var index: float = -1
var _pressing_time: float = 0


func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			if index == -1:
				index = event.index
				_drop_position = global_position + event.position
				_on_drop_timer_timeout()
				$DropTimer.start(0.25)
		else:
			if index == event.index:
				$DropTimer.stop()
				index = -1
	if event is InputEventScreenDrag:
		if index == event.index:
			var new_pos = _drop_position + event.relative
			if get_global_rect().has_point(new_pos):
				_drop_position += event.relative
			else:
				index = -1
				$DropTimer.stop()
			


func _on_drop_timer_timeout() -> void:
	character_dropped.emit(_drop_position)
	$DropTimer.start(0.15)
