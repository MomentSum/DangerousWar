extends Container


class_name CardsContainer


signal card_down(card: CharacterCard)


@export var character_card_scene: PackedScene

@export var team_index: int:
	set(new):
		team_index = new
		if team_index < 0:
			modulate = Color.WHITE
		else:
			modulate = GameRunningData.teams_colors[team_index]


@export var selection_cancelable: bool

var selecting_card: CharacterCard


func set_data(card_datas: Array[CharacterData]) -> void:
	clear()
	for data in card_datas:
		var character_card = character_card_scene.instantiate() as CharacterCard
		character_card.set_data(data)
		character_card.card_button_down.connect(press_card.bind(character_card))
		add_child(character_card)


func clear() -> void:
	for child in get_children():
		child.queue_free()


func press_card(card: CharacterCard) -> void:
	if selecting_card == card and selection_cancelable:
		press_card(null)
		return
	
	if is_instance_valid(selecting_card):
		selecting_card.be_deselected()
	
	selecting_card = card
	card_down.emit(card)
	if is_instance_valid(card):
		selecting_card.be_selected()
