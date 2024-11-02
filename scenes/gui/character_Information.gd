extends VBoxContainer


func set_data(data: CharacterData) -> void:
	$Name.text = data.name
	$Icon.texture = data.icon
	$Price.text = tr("game.price") + str(data.price)
	$Description.text = data.description
