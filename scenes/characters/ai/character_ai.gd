extends Node2D

class_name CharacterAI

@export var character: Character


var target: Character:
	get:
		return character.target

var MOVE_SPEED: float:
	get:
		return character.MOVE_SPEED
