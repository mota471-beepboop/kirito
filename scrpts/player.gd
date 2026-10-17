extends CharacterBody2D

@export var speed: float = 300.0
@export var jump_velocity: float = -600.0
@onready var sprite = $Sprite2D
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	sprite.flip_h = false
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("pulo") and is_on_floor():
		velocity.y = jump_velocity

	var direction := Input.get_axis("esquerda", "direita")
	if direction != 0:
		if direction<0:
			sprite.flip_h = true
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
