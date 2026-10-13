# kirito
jogo da memoria

extends CharacterBody2D

@exports var speed: float = 300.0
@export var jump_velocity: float = -400.0

#vai pega a gravidade do proprio projeto
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func_physics_process(delta: float) -> void:
#vai pega a gravidade fora do chao
if not is_on_floor():
    velocity.y += gravity * delta

#pulo
if Input.is_action_just_pressed("ui_accept") and is_on_floor():
    velocity.y = jump_velocity

#horizontal
var direction: = Input.get_axis("ui_left", "ui_right")
if direction !=0:
    velocity.x = direction * speed
else:
    velocity.x = move_toward(velocity.x, 0, speed)

move_and_slide()
