extends Control

func _on_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/gui/character_selection.tscn")
	GameRunningData.game_mode = 0


func _on_manual_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/gui/manual.tscn")


func _on_sandbox_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/sandbox_game.tscn")
	GameRunningData.game_mode = 1


func _on_settings_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/gui/settings.tscn")
