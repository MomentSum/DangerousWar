extends Node

const SETTINGS_PATH := "user://settings.res"

var character_datas: Array[CharacterData]

var settings: SettingsData

func _ready() -> void:
	var characters_group = preload("res://resources/data/characters.tres") as ResourceGroup
	characters_group.load_all_into(character_datas)
	
	if FileAccess.file_exists(SETTINGS_PATH):
		settings = load(SETTINGS_PATH)
	else:
		settings = SettingsData.new()


func save_settings() -> void:
	ResourceSaver.save(settings, SETTINGS_PATH)
