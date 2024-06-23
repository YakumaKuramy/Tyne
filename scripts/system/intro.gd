extends Control

@export var path	: String

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	GTransitionsScreen.path = path
	GTransitionsScreen.fade_in()
