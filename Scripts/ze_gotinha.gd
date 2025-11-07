extends StaticBody2D

var playerDentro = false
var dialogo : PackedScene
var instanciaDialogo
var dialogoAberto = false

func _ready() -> void:
	dialogo = preload("res://Scenes/dialogo_ze_gotinha.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		playerDentro = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name=="Player"):
		playerDentro = false
		if(dialogoAberto):
			fecharDialogo()
	
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_interact") and playerDentro):
		if(dialogoAberto):
			fecharDialogo()
		else:
			mostraDialogo()


	if(Input.is_action_pressed("ui_interact")):
		$bindInteracao.frame=1
	else:
		$bindInteracao.frame=0



	if(playerDentro):
		$bindInteracao.visible=true
	else:
		$bindInteracao.visible=false

func mostraDialogo():
	if(dialogoAberto==false):
		instanciaDialogo = dialogo.instantiate()
		print(instanciaDialogo)
		get_tree().root.get_node("MainScene/Dialog").add_child(instanciaDialogo)
		instanciaDialogo.global_position = Vector2(0, 0)
		dialogoAberto=true


func fecharDialogo():
	print("fechando dialogo")
	dialogoAberto=false
	instanciaDialogo.queue_free()
	instanciaDialogo = null
