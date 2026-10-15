extends CharacterBody2D
var started = false
var start_speed = 500
var incremental_speed = 1.02
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var angle = [-250,250]
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_pressed("Start") and started==false:
		start_game()
	if started:
		var collision = move_and_collide(velocity*delta)
		if collision != null:
			velocity = velocity.bounce(collision.get_normal())*incremental_speed
func start_game():
	started = true
	velocity.y= -start_speed
	velocity.x = angle.pick_random()
	print("arremsa a bola")
