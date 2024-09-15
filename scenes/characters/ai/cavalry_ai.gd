extends CharacterAI

@export var keep_distance_min: float
@export var keep_distance_max: float
@export var move_speed: float

@export var rush_wait: float
@export var rush_speed: float

var _rushing: float


func _ready() -> void:
	$RushTimer.wait_time = rush_wait


func _process(delta: float) -> void:
	super(delta)
	
