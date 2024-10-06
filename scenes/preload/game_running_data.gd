extends Node

@export var teams_colors: Array[Color]
@export var teams_names: Array[StringName]

@export var selecting_datas: Array[Array]

func _ready() -> void:
	selecting_datas.resize(2)
