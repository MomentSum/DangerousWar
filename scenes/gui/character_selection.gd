extends Control


func _on_start_button_up() -> void:
	GameRunningData.selecting_datas[0] = %RedCards.selecting_datas
	GameRunningData.selecting_datas[1] = %BlueCards.selecting_datas
	get_tree().change_scene_to_file("res://scenes/game.tscn")
