extends Control

@export var game_path	: String

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("buttons"):
		button.pressed.connect(self._on_button_pressed.bind(button))


func _on_button_pressed(button : Button) -> void:
	match button.name:
		"play":
			GTransitionsScreen.path = game_path
			GTransitionsScreen.fade_in()
		"exit":
			GTransitionsScreen.exit_game()
