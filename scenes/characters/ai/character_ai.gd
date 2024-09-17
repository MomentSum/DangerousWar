extends Node2D

class_name CharacterAI

@export var character: Character


var target: Character:
	get:
		return character.target
