extends Node


func get_free_audio_player_2d() -> AudioStreamPlayer2D:
	for player: AudioStreamPlayer2D in $"2DPlayers".get_children():
		if not player.playing:
			return player
	var new = AudioStreamPlayer2D.new()
	$"2DPlayers".add_child(new)
	return new


func play_2d(stream: AudioStream, posiiton: Vector2, volume_db: float = 0) -> void:
	var player = get_free_audio_player_2d()
	player.position = posiiton
	player.stream = stream
	player.volume_db = volume_db
	player.play()

func get_free_audio_player() -> AudioStreamPlayer:
	for player: AudioStreamPlayer in $"2DPlayers".get_children():
		if not player.playing:
			return player
	var new = AudioStreamPlayer.new()
	$"Players".add_child(new)
	return new


func play(stream: AudioStream, volume_db: float = 0) -> void:
	var player = get_free_audio_player()
	player.stream = stream
	player.volume_db = volume_db
	player.play()
