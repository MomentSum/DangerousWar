extends Area2D


signal be_destoryed


@export var team_index: int
@export var character_scene: PackedScene
@export var health_max: int

var health: int


func _ready() -> void:
	health = health_max
	
	var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
	modulate = GameRunningData.teams_colors[team_index]
	for marker in $Markers.get_children():
		var character = character_scene.instantiate()
		character.position = marker.global_position
		character.aggression_multiple = 3
		if global_position.x < viewport_width / 2:
			character.position.x -= viewport_width
		else:
			character.position.x += viewport_width
			scale.y = -scale.x
			rotation = PI
		character.team_index = team_index
		character.refind_target_wait = 1e+10
		get_tree().get_first_node_in_group("characters_space").add_child(character)

func _on_area_entered(area: Area2D) -> void:
	if health > 0 and area is Hurtbox:
		if area.character.team_index != team_index:
			area.be_attacked(1e+10, 1)
			health -= area.character.castle_damage
			$HealthBar.scale.y = health / 1.0 / health_max
			if health <= 0:
				be_destoryed.emit()
