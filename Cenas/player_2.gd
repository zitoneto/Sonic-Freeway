extends Area2D

signal pontua
@export var speed: float = 250.0
var screen_size: Vector2
var posicao_inicial: Vector2 = Vector2(970,640)

func _ready():
	screen_size = get_viewport_rect().size
	position = posicao_inicial

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_key_pressed(KEY_W):
		velocity.y -= 1
	if Input.is_key_pressed(KEY_S):
		velocity.y += 1
	if Input.is_key_pressed(KEY_A):
		velocity.x -= 1
	if Input.is_key_pressed(KEY_D):
		velocity.x += 1
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed

	position += velocity * delta
	position.y = clamp(position.y, 0.0, screen_size.y)

	if velocity.y > 0:
		$animacaoP2.play("baixo")
	elif velocity.y < 0:
		$animacaoP2.play("cima")
	elif velocity.x < 0:
		$animacaoP2.play("esquerda")
		$animacaoP2.flip_h = true
	elif velocity.x > 0:
		$animacaoP2.play("direita")
		$animacaoP2.flip_h = false
	else:
		$animacaoP2.stop()

func _on_body_entered(body: Node2D) -> void:
	if body.name == "LinhaChegada":
		emit_signal ("pontua")
		position = posicao_inicial
	else:
		$audioP2.play()
		position = posicao_inicial
