extends Control


@export var drop_area: CharacterDropArea
@export var team_group: StringName

var _selecting_card: CharacterCard


func _ready() -> void:
	for card: CharacterCard in %Cards.get_children():
		card.card_button_down.connect(_on_card_button_down.bind(card))
	
	var color_node = get_tree().get_first_node_in_group(team_group+"_color")
	if is_instance_valid(color_node):
		modulate = color_node.modulate
		modulate.a = 0.5
		if is_instance_valid(drop_area):
			drop_area.color = color_node.modulate
	
	if is_instance_valid(drop_area):
		drop_area.character_dropped.connect(_on_character_dropped)


func _on_card_button_down(card: CharacterCard) -> void:
	if is_instance_valid(_selecting_card):
		_selecting_card.be_deselected()
	if _selecting_card == card:
		_selecting_card = null
		return
	_selecting_card = card
	_selecting_card.be_selected()


func _on_character_dropped(position: Vector2) -> void:
	if not is_instance_valid(_selecting_card):
		return
	var character = _selecting_card.character_scene.instantiate() as Character
	character.team_group = team_group
	character.position = position
	get_tree().get_first_node_in_group("characters_space").add_child(character)
