extends Node

var cenaCarros = preload("res://Cenas/carros.tscn")
var score = 0
var pistas_rapidas_y = [205, 265, 315]
var pistas_lentas_y = [430, 490, 550, 610, 670]
var timer: int = 136

func _ready() -> void:
	$HUD/Placar.text = str(score)
	$HUD/Mensagem.text = " "
	$HUD/Button.hide()
	$AudioTema.play()
	$HUD/TimerLabel.text = "Tempo: " + str(timer)

func _on_timer_carros_rapidos_timeout() -> void:
	var carros = cenaCarros.instantiate()
	add_child(carros)
	var pista_y = pistas_rapidas_y[randi_range(0, pistas_rapidas_y.size() - 1)]
	carros.position = Vector2(1272, pista_y)
	carros.set_linear_velocity(Vector2(randf_range(-700, -720), 0))
	carros.set_linear_damp(0.0)



func _on_timer_carros_lentos_timeout() -> void:
	var carros = cenaCarros.instantiate()
	add_child(carros)
	var pista_y = pistas_lentas_y[randi_range(0, pistas_rapidas_y.size() - 1)]
	carros.position = Vector2(-10, pista_y)
	carros.set_linear_velocity(Vector2(randf_range(300, 310), 0))
	carros.set_linear_damp(0.0)
	carros.get_node("Animated").flip_h = true
	carros.set_linear_velocity(Vector2(randf_range(300, 310), 0))
	carros.set_linear_damp(0.0)
	carros.set_linear_velocity(Vector2(randf_range(700, 720), 0))
	carros.set_linear_damp(0.0)




func _on_player_pontua() -> void:
	if score <= 10:
		score += 1
		$HUD/Placar.text = str(score)
		$AudioPonto.play()
	if score == 10:
		$HUD/Mensagem.text = "Parabens!"
		$HUD/Button.show()
		$TimerCarrosLentos.stop()
		$TimerCarrosLentos.stop()
		$AudioVitoria.play()
		$Player.speed = 0



func _on_timer_tempo_timeout() -> void:
	timer -= 1
	$HUD/TimerLabel.text = "Tempo: " + str(timer)
	if timer <= 0:
		$timerTempo.stop()
	
