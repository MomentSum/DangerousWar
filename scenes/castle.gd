extends Area2D


@export var team_group: StringName


func _ready() -> void:
	modulate = get_tree().get_first_node_in_group(team_group + "_color").modulate


func _on_area_entered(area: Area2D) -> void:
	if area is Hurtbox:
		area.be_attacked(1e+10, 1)
