extends Control

class_name CharacterCard


signal card_button_down


@export var character_scene: PackedScene
@export var icon: Texture


func _ready() -> void:
	$Icon.texture = icon


func _on_gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		if event.pressed:
			card_button_down.emit()


func be_selected() -> void:
	create_tween().tween_property(self,"scale",Vector2.ONE * 1.2, 0.1)


func be_deselected() -> void:
	create_tween().tween_property(self,"scale", Vector2.ONE, 0.1)
