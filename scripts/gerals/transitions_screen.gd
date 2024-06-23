extends CanvasLayer

@onready var animations = $animations

@export var path	: String


func fade_in() -> void:
	animations.play("fade_in")


func restart_game() -> void:
	animations.play("restart_game")


func exit_game() -> void:
	animations.play("exit_game")



func _on_animations_finished(anim_name : String) -> void:
	match anim_name:
		"fade_in":
			get_tree().change_scene_to_file(path)
			animations.play("fade_out")
		"fade_out":
			pass
		"restart_game":
			get_tree().reload_current_scene()
			animations.play("fade_out")
		"exit_game":
			get_tree().quit()
