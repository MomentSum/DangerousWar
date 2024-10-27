extends Node

@export var character_move_speed: float = 17

@export var teams_colors: Array[Color]
@export var teams_names: Array[StringName]

@export var selecting_datas: Array[Array]
@export var game_mode: int


func _ready() -> void:
	selecting_datas.resize(2)
