extends Control


@export var character_card_scene: PackedScene


func _ready() -> void:
	for data in Assets.character_datas:
		var card = character_card_scene.instantiate() as CharacterCard
		card.set_data(data)
		$Characters.add_child(card)
		
