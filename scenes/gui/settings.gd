extends PanelContainer


func _ready() -> void:
	$HBoxContainer/VBoxContainer/BGMVolume/HSlider.value = Assets.settings.bgm_volume
	$HBoxContainer/VBoxContainer/AudioVolume/HSlider.value = Assets.settings.audio_volume
	$HBoxContainer/VBoxContainer/LeftTeamName/TextEdit.text = Assets.settings.left_team_name
	$HBoxContainer/VBoxContainer/RightTeamName/TextEdit.text = Assets.settings.right_team_name


func _on_bgm_volume_value_changed(value: float) -> void:
	AudioManager.set_bgm_voume_db(value)
	Assets.settings.bgm_volume = value


func _on_audio_volume_value_changed(value: float) -> void:
	AudioManager.change_volume_db(value - Assets.settings.audio_volume)
	Assets.settings.audio_volume = value


func _on_left_team_name_text_changed() -> void:
	Assets.settings.left_team_name = $HBoxContainer/VBoxContainer/LeftTeamName/TextEdit.text
	GameRunningData.teams_names[0] = $HBoxContainer/VBoxContainer/LeftTeamName/TextEdit.text


func _on_right_team_name_text_changed() -> void:
	Assets.settings.right_team_name = $HBoxContainer/VBoxContainer/RightTeamName/TextEdit.text
	GameRunningData.teams_names[1] = $HBoxContainer/VBoxContainer/RightTeamName/TextEdit.text




func _on_left_team_color_color_changed(color: Color) -> void:
	pass


func _on_back_button_button_up() -> void:
	Assets.save_settings()
	get_tree().change_scene_to_file("res://scenes/title.tscn")
