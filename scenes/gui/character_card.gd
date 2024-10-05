extends Control

class_name CharacterCard


signal card_button_down

var data: CharacterData


func set_data(new) -> void:
	data = new
	$Icon.texture = data.icon
	$Price.text = str(data.price)



func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			card_button_down.emit()


func be_selected() -> void:
	$Bias.show()


func be_deselected() -> void:
	$Bias.hide()


func be_enabled() -> void:
	modulate = Color.WHITE


func be_disabled() -> void:
	modulate = Color.DARK_GRAY
