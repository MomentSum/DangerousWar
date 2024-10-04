extends Node


var character_datas: Array[CharacterData]

func _ready() -> void:
	var characters_group = preload("res://resources/data/characters.tres") as ResourceGroup
	characters_group.load_all_into(character_datas)
