extends Node2D

@export var team_index: int
@export var count: int
@export var scene: PackedScene

func _ready() -> void:
	for i in range(count):
		var ins = scene.instantiate()
		ins.position = position
		ins.team_index = team_index
		call_deferred("add_sibling",ins)
