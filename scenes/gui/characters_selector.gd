extends HFlowContainer

@export var character_card_scene: PackedScene
@export var slots_bar: Control
@export var random_button: Button

var selecting_cards: Array[CharacterCard]

func _ready() -> void:
	for data in Assets.character_datas:
		var card = character_card_scene.instantiate() as CharacterCard
		card.set_data(data)
		card.card_button_down.connect(_on_card_down.bind(card))
		add_child(card)
	
	for slot: CharacterSlot in slots_bar.get_children():
		slot.slot_down.connect(_on_slot_down.bind(slot))
	
	random_button.button_up.connect(random_cards)


func _on_card_down(card: CharacterCard) -> void:
	if selecting_cards.has(card):
		card.be_enabled()
		selecting_cards.erase(card)
		for i in range(slots_bar.get_child_count()):
			if i < selecting_cards.size():
				slots_bar.get_child(i).set_card(selecting_cards[i])
			else:
				slots_bar.get_child(i).set_card(null)
	elif selecting_cards.size() < 7:
		card.be_disabled()
		selecting_cards.append(card)
		var index =selecting_cards.size() - 1
		slots_bar.get_child(index).set_card(card)


func _on_slot_down(slot: CharacterSlot) -> void:
	_on_card_down(slot.card)


func get_selecting_datas() -> Array[CharacterData]:
	var arr:Array[CharacterData] = []
	for card in selecting_cards:
		arr.append(card.data)
	return arr


func random_cards() -> void:
	for card in selecting_cards.duplicate():
		_on_card_down(card)
	var arr = range(get_child_count())
	arr.shuffle()
	for index in arr.slice(0, 7):
		_on_card_down(get_child(index))
