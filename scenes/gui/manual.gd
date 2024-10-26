extends Control


@export var character_card_scene: PackedScene


var _selecting_card: CharacterCard


func _ready() -> void:
	for data in Assets.character_datas:
		var card = character_card_scene.instantiate() as CharacterCard
		card.set_data(data)
		card.card_button_down.connect(_on_card_down.bind(card))
		%Characters.add_child(card)


func _on_card_down(card: CharacterCard) -> void:
	if _selecting_card:
		_selecting_card.be_enabled()
	
	if not card:
		return
	
	_selecting_card = card
	_selecting_card.be_disabled()
	%Information.set_data(card.data)
	


func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn")
