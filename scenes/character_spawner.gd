extends Node2D

@export var team_group: StringName
@export var count: int
@export var scene: PackedScene

func _ready() -> void:
	for i in range(count):
		var ins = scene.instantiate()
		ins.position = position
		ins.team_group = team_group
		call_deferred("add_sibling",ins)
