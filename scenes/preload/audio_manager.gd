extends Node


func get_free_audio_player_2d() -> AudioStreamPlayer2D:
	for player: AudioStreamPlayer2D in $"2DPlayers".get_children():
		if not player.playing:
			return player
	var new = AudioStreamPlayer2D.new()
	new.volume_db = Assets.settings.audio_volume
	$"2DPlayers".add_child(new)
	return new


func play_2d(stream: AudioStream, posiiton: Vector2, volume_db: float = 0) -> void:
	var player = get_free_audio_player_2d()
	player.position = posiiton
	player.stream = stream
	player.volume_db = Assets.settings.audio_volume + volume_db
	player.play()

func get_free_audio_player() -> AudioStreamPlayer:
	for player: AudioStreamPlayer in $"2DPlayers".get_children():
		if not player.playing:
			return player
	var new = AudioStreamPlayer.new()
	new.volume_db = Assets.settings.audio_volume
	$"Players".add_child(new)
	return new


func play(stream: AudioStream, volume_db: float = 0) -> void:
	var player = get_free_audio_player()
	player.stream = stream
	player.volume_db = Assets.settings.audio_volume +  volume_db
	player.play()


func change_volume_db(change: float) -> void:
	var players = $Players.get_children()
	players.append_array($"2DPlayers".get_children())
	for player in players:
		player.volume_db += change


func set_bgm_voume_db(volume_db: float) -> void:
	$BGMPlayer.volume_db = volume_db
