extends Character




func _on_movement_ai_attack() -> void:
	%ArrowLauncher.launch(target.position)
	%Bow.play("launch")


func _on_movement_ai_attacking_began() -> void:
	%Bow.play("launch")


func _on_movement_ai_attacking_ended() -> void:
	%Bow.play("default")
