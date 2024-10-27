extends Control

@export var card_scene: PackedScene
@export var drop_area: CharacterDropArea
@export var team_index: int
@export var cost_money: bool
@export var money_add_speed: float

var _money: float


func _ready() -> void:
	%Cards.team_index = team_index
	
	%Cards.set_data(GameRunningData.selecting_datas[team_index])
	var color = GameRunningData.teams_colors[team_index]
	$Bar.self_modulate = color
	$Bar.self_modulate.a = 0.9
	$Money.modulate = color
	if is_instance_valid(drop_area):
		drop_area.modulate *= color
	
	if is_instance_valid(drop_area):
		drop_area.character_dropped.connect(_on_character_dropped)



func _process(delta: float) -> void:
	if cost_money:
		_money += money_add_speed * delta
		for card in %Cards.get_children():
			if  is_instance_valid(card.data):
				if _money >= card.data.price:
					card.be_enabled()
				else:
					card.be_disabled()
	%MoneyLabel.text = str(int(_money))


func _on_character_dropped(pos: Vector2) -> void:
	if not is_instance_valid(%Cards.selecting_card):
		return
	
	if cost_money and _money < %Cards.selecting_card.data.price:
		return
	
	var character = %Cards.selecting_card.data.character_scene.instantiate() as Character
	character.team_index = team_index
	character.position = pos
	get_tree().get_first_node_in_group("characters_space").add_child(character)
	
	if cost_money:
		_money -= %Cards.selecting_card.data.price
	else:
		_money += %Cards.selecting_card.data.price
