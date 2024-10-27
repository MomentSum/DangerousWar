extends Control


func _ready() -> void:
	ProjectSettings.settings_changed.connect(update)
	update()


func _process(_delta: float) -> void:
	$FPSLabel.text = "FPS:" + str(Performance.get_monitor(Performance.TIME_FPS))

func update() -> void:
	$FPSLabel.visible = ProjectSettings.get_setting("game/debug/fps_display", false)
