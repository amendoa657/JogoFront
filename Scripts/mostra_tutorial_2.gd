extends Area2D

var playerDentro = false

func _on_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		$bindInteracao.visible=true
		playerDentro=true


func _on_body_exited(body: Node2D) -> void:
	if(body.name=="Player"):
		$bindInteracao.visible=false
		playerDentro=false
