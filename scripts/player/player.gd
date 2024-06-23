extends CharacterBody2D

@onready var animation	: AnimationPlayer	= $animation
@onready var texture	: Sprite2D			= $texture

@export var can_move	: bool = true
@export var is_running	: bool = false
@export var speed		: float = 640.0
@export var lerp_factory: float = 0.05
@export var dead_zone	: float = 0.50

func _physics_process(_delta : float) -> void:
	var input_vector	: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down", dead_zone)
	var target_velocity	: Vector2 = input_vector * speed
	var was_running		: bool = is_running
	
	velocity = lerp(velocity, target_velocity, lerp_factory)
	is_running = not input_vector.is_zero_approx()
	if was_running != is_running:
		if is_running:
			animation.play("run")
		else:
			animation.play("idle")
	
	if input_vector.x > 0:
		texture.flip_h = false
	elif input_vector.x < 0:
		texture.flip_h = true
	
	move_and_slide()
