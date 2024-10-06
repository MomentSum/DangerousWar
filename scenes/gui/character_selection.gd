extends Control


func _ready() -> void:
	$RedCardsPanel.modulate  = GameRunningData.teams_colors[0]
	$RedSlots.modulate  = GameRunningData.teams_colors[0]
	$BlueCardsPanel.modulate  = GameRunningData.teams_colors[1]
	$BlueSlots.modulate  = GameRunningData.teams_colors[1]


func _on_start_button_up() -> void:
	GameRunningData.selecting_datas[0] = %RedCards.get_selecting_datas()
	GameRunningData.selecting_datas[1] = %BlueCards.get_selecting_datas()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
