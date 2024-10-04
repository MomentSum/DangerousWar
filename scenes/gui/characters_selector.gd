extends HFlowContainer

@export var character_card_scene: PackedScene
@export var slots_bar: Control

var selecting_datas: Array[CharacterData]

func _ready() -> void:
	for data in Assets.character_datas:
		var card = character_card_scene.instantiate() as CharacterCard
		card.set_data(data)
		card.card_button_down.connect(_on_card_down.bind(card))
		add_child(card)
	


func _on_card_down(card: CharacterCard) -> void:
	var data = card.data
	if selecting_datas.has(data):
		card.be_enabled()
		selecting_datas.erase(data)
		for i in range(slots_bar.get_child_count()):
			if i < selecting_datas.size():
				slots_bar.get_child(i).set_data(selecting_datas[i])
			else:
				slots_bar.get_child(i).set_data(null)
	elif selecting_datas.size() < 7:
		card.be_disabled()
		selecting_datas.append(data)
		var index =selecting_datas.size() - 1
		slots_bar.get_child(index).set_data(data)
		slots_bar.get_child(index).card = card
