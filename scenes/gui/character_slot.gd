extends Control


class_name CharacterSlot


signal slot_down


var data: CharacterData

var card: CharacterCard

func set_data(data: CharacterData) -> void:
	if self.data == data:
		return
	
	self.data = data
	if is_instance_valid(data):
		%View.create_tween().tween_property(%View, "scale", Vector2.ONE, 0.2).from(Vector2.ONE / 2).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
		%Icon.texture = data.icon
		%View.show()
	else:
		%View.hide()


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			if is_instance_valid(data):
				slot_down.emit()
