extends Control


func _ready() -> void:
	$VersionLabel.text ="V" + str(ProjectSettings.get_setting("application/config/version"))


func _process(_delta: float) -> void:
	$FPSLabel.text = "FPS:" + str(Performance.get_monitor(Performance.TIME_FPS))
