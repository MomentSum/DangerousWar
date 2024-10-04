extends Control


@export var drop_area: CharacterDropArea
@export var team_group: StringName
@export var cost_money: bool
@export var money_add_speed: float

var _selecting_card: CharacterCard

var _money: float


func _ready() -> void:
	for card: CharacterCard in %Cards.get_children():
		card.card_button_down.connect(_on_card_button_down.bind(card))
	
	var color_node = get_tree().get_first_node_in_group(team_group+"_color")
	if is_instance_valid(color_node):
		modulate = color_node.modulate
		modulate.a = 0.9
		if is_instance_valid(drop_area):
			drop_area.color = color_node.modulate
	
	if is_instance_valid(drop_area):
		drop_area.character_dropped.connect(_on_character_dropped)



func _process(delta: float) -> void:
	if cost_money:
		_money += money_add_speed * delta
		for card in %Cards.get_children():
			if _money >= card.price:
				card.be_enabled()
			else:
				card.be_disabled()
	%MoneyLabel.text = str(int(_money))


func _on_card_button_down(card: CharacterCard) -> void:
	if is_instance_valid(_selecting_card):
		_selecting_card.be_deselected()
	if _selecting_card == card:
		_selecting_card = null
		return
	_selecting_card = card
	_selecting_card.be_selected()


func _on_character_dropped(pos: Vector2) -> void:
	if not is_instance_valid(_selecting_card):
		return
	
	if cost_money and _money < _selecting_card.price:
		return
	
	var character = _selecting_card.character_scene.instantiate() as Character
	character.team_group = team_group
	character.position = pos
	get_tree().get_first_node_in_group("characters_space").add_child(character)
	
	if cost_money:
		_money -= _selecting_card.price
	else:
		_money += _selecting_card.price
