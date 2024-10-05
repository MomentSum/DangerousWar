extends Control


func _on_start_button_up() -> void:
	GameRunningData.selecting_datas[0] = %RedCards.get_selecting_datas()
	GameRunningData.selecting_datas[1] = %BlueCards.get_selecting_datas()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
