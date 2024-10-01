extends Node2D

var win_team: StringName


func _on_red_castle_be_destoryed() -> void:
	set_winner("Blue")
	$Anim.play("game_over")


func _on_blue_castle_be_destoryed() -> void:
	set_winner("Red")
	$Anim.play("game_over")

func set_winner(new: StringName) -> void:
	win_team = new
	%WinInfo.modulate = get_tree().get_first_node_in_group(win_team + "_color").modulate
	%WinInfo/Label2.text = "WINNER: " + win_team
