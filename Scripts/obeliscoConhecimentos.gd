extends StaticBody2D

var playerDentro = false
var instanciaDialogo
var dialogoAberto = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("ui_interact") and playerDentro):
		if OS.has_feature("web"):
			JavaScriptBridge.get_interface("window").call("AbrirInformacoesZeGotinha")
		else:
			print("Fora da web (Editor), pulando chamada JS.")


	if(Input.is_action_pressed("ui_interact")):
		$bindInteracao.frame=1
	else:
		$bindInteracao.frame=0



	if(playerDentro):
		$bindInteracao.visible=true
	else:
		$bindInteracao.visible=false
