extends Node2D


func _ready() -> void:
	pause()


func resume() -> void:
	%Spaces.process_mode = Node.PROCESS_MODE_INHERIT
	$Areas.process_mode =Node.PROCESS_MODE_DISABLED
	%Anim.play("resume");

func pause() -> void:
	%Spaces.process_mode = Node.PROCESS_MODE_DISABLED
	$Areas.process_mode =Node.PROCESS_MODE_INHERIT
	%Anim.play("pause")


func _on_pause_button_button_down() -> void:
	pause()


func _on_exit_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/title.tscn")


func _on_play_button_button_up() -> void:
	resume()


func _on_restart_button_button_up() -> void:
	get_tree().change_scene_to_file("res://scenes/sandbox_game.tscn")
