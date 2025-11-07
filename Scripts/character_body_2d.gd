extends CharacterBody2D

@export var speed = 100
var sentado=false
var bancoAtual=null
var posicaoAntesDeSentar=0
var movimentacaoHabilitada=true

signal interact(player)


func movimentacao():
	var movDir = Vector2(
		Input.get_action_raw_strength("ui_right")-Input.get_action_raw_strength("ui_left"),
		Input.get_action_raw_strength("ui_down")-Input.get_action_raw_strength("ui_up")
	).normalized()
	
	velocity = movDir*speed
	
	move_and_slide()

func _ready() -> void:
	$AnimatedSprite2D.animation="frente"

func _process(delta: float) -> void:
	if(movimentacaoHabilitada):
		movimentacao()
	
	if(velocity!=Vector2(0,0)):
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame=0
	
	if(Input.is_action_just_pressed("ui_interact")):
		emit_signal("interact", self)
		
		
func _on_bench_player_sit(bench):
	sentado = not sentado
	print("sentado eh ", sentado)
	print("Sentei no banco:", bench.name)
	if(sentado):
		self.global_position=bench.global_position
		movimentacaoHabilitada=false
	else:
		movimentacaoHabilitada=true
		self.global_position = Vector2(bench.global_position.x-10, bench.global_position.y)
