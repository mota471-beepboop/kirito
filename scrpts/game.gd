extends Node2D
@onready var ball=$bola
@onready var label_ponto1=$pontos1
@onready var label_ponto2=$pontos2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label_ponto1.text = str(ball.ponto1)
	label_ponto2.text = str(ball.ponto2)
	if ball.ponto1==3 or ball.ponto2==3:
		get_tree().reload_current_scene()
