extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volume_pressed() -> void:
	pass # Replace with function body.


func _on_projetos_pressed() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.get_interface("window").call("as")
	else:
		print("Fora da web (Editor), pulando chamada JS. (Projetos)")



func _on_linkedin_pressed() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.get_interface("window").call("AbrirLinkedin")
	else:
		print("Fora da web (Editor), pulando chamada JS. (Linkedin)")


func _on_conhecimentos_pressed() -> void:
	if OS.has_feature("web"):
		JavaScriptBridge.get_interface("window").call("AbrirConhecimentos")
	else:
		print("Fora da web (Editor), pulando chamada JS. (Conhecimentos)")







func _on_modo_escuro_toggled(toggled_on: bool) -> void:
	if($UI/Control/modoEscuro.button_pressed==true):
		$CanvasModulate/AnimationPlayer.play("Noite")
	else:
		$CanvasModulate/AnimationPlayer.play("Dia")
