extends Control


func _ready() -> void:
	$VBoxContainer/BGMVolume/HSlider.value = Assets.settings.bgm_volume
	$VBoxContainer/AudioVolume/HSlider.value = Assets.settings.audio_volume
	$VBoxContainer/LeftTeamName/TextEdit.text = Assets.settings.left_team_name
	$VBoxContainer/RightTeamName/TextEdit.text = Assets.settings.right_team_name
	
	match(Assets.settings.locate):
		"en":
			$VBoxContainer/Language/OptionButton.select(1)
		"zh":
			$VBoxContainer/Language/OptionButton.select(0)


func _on_bgm_volume_value_changed(value: float) -> void:
	AudioManager.set_bgm_voume_db(value)
	Assets.settings.bgm_volume = value


func _on_audio_volume_value_changed(value: float) -> void:
	AudioManager.change_volume_db(value - Assets.settings.audio_volume)
	Assets.settings.audio_volume = value


func _on_left_team_name_text_changed() -> void:
	Assets.settings.left_team_name = $VBoxContainer/LeftTeamName/TextEdit.text
	GameRunningData.teams_names[0] = $VBoxContainer/LeftTeamName/TextEdit.text


func _on_right_team_name_text_changed() -> void:
	Assets.settings.right_team_name = $VBoxContainer/RightTeamName/TextEdit.text
	GameRunningData.teams_names[1] = $VBoxContainer/RightTeamName/TextEdit.text


func _on_back_button_button_up() -> void:
	Assets.save_settings()
	get_tree().change_scene_to_file("res://scenes/title.tscn")


func _on_option_button_item_selected(index: int) -> void:
	match(index):
		0:
			Assets.settings.locate = "zh"
			TranslationServer.set_locale("zh")
		1:
			Assets.settings.locate = "en"
			TranslationServer.set_locale("en")
