extends VBoxContainer


func set_data(data: CharacterData) -> void:
	$Name.text = data.name
	$Icon.texture = data.icon
	$Price.text = "Price:%s" % data.price
	$Description.text = data.description
