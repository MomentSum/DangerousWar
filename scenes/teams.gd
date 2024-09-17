extends Node

@export var team_colors: Dictionary

func _ready() -> void:
	for team_name in team_colors:
		var node = Node.new()
		node.name = team_name + "Color"
		node.add_to_group(team_name + "_color")
		add_child(node)
