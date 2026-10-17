extends CharacterBody2D
@export var speed = 1000
@export var jump_velocity: float = -400
var bola
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready():
	bola = get_parent().get_node("bola")
func _physics_process(delta):
	velocity.x=0
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_pressed("ui_left") and bola.started == true :
		velocity.x -=speed
	if Input.is_action_pressed("ui_right") and bola.started == true :
		velocity.x +=speed  
	if Input.is_action_pressed("ui_up) and is_on_floor():
		velocity.y = jump_velocity
		
	move_and_collide(velocity*delta)
	
