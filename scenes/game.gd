extends Node2D

var win_team_index: int


func _on_red_castle_be_destoryed() -> void:
	game_over(1)
	$Anim.play("game_over")


func _on_blue_castle_be_destoryed() -> void:
	game_over(0)


func game_over(team_index: int) -> void:
	win_team_index = team_index
	%WinInfo.modulate = GameRunningData.teams_colors[team_index]
	%WinInfo/Label2.text = "WINNER: " + GameRunningData.teams_names[team_index]
	$Anim.play("game_over")
	Engine.time_scale = 0.5
	await get_tree().create_timer(0.5)
	get_tree().paused = true
	Engine.time_scale = 1
