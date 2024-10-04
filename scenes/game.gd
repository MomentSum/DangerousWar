extends Node2D

var win_team: StringName


func _on_red_castle_be_destoryed() -> void:
	game_over("Blue")
	$Anim.play("game_over")


func _on_blue_castle_be_destoryed() -> void:
	game_over("Red")

func game_over(new: StringName) -> void:
	win_team = new
	%WinInfo.modulate = get_tree().get_first_node_in_group(win_team + "_color").modulate
	%WinInfo/Label2.text = "WINNER: " + win_team
	$Anim.play("game_over")
	Engine.time_scale = 0.5
	await get_tree().create_timer(0.5)
	get_tree().paused = true
	Engine.time_scale = 1
