extends CharacterBody2D
var posicao_inicial: Vector2
var started = false
var start_speed = 500
var incremental_speed = 1.05
var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")
var angle = [-250,250]
var ponto1=0
var ponto2=0
func _ready() -> void:
	posicao_inicial = global_position
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_pressed("Start") and started==false:
		start_game()
	if started:
		var collision = move_and_collide(velocity*delta)
		if collision != null:
			if collision.get_collider().name == "player" or collision.get_collider().name == "player2":
				velocity = velocity.bounce(collision.get_normal())*incremental_speed
			else:
				velocity = velocity.bounce(collision.get_normal())
			if collision.get_collider().name == "chao wall1":
				ponto2+=1
				resetar()
			if collision.get_collider().name == "chao wall2":
				ponto1+=1
				resetar()
func start_game():
	
	started = true
	velocity.y= -start_speed
	velocity.x = angle.pick_random()
	print("arremsa a bola")
func resetar():
	global_position = posicao_inicial
	velocity = Vector2.ZERO
	velocity.y=0
	start_game()
