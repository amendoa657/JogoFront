extends StaticBody2D


var playerDentro = false

signal player_sit(player)

func _process(delta: float) -> void:
	if(Input.is_action_pressed("ui_interact")):
		$bindInteracao.frame=1
	else:
		$bindInteracao.frame=0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		$bindInteracao.visible=true
		body.connect("interact", Callable(self, "_on_player_interact"))
		connect("player_sit", Callable(body, "_on_bench_player_sit"))


func _on_area_2d_body_exited(body: Node2D) -> void:
	if(body.name=="Player"):
		$bindInteracao.visible=false
		playerDentro=false
		body.disconnect("interact", Callable(self, "_on_player_interact"))
		disconnect("player_sit", Callable(body, "_on_bench_player_sit"))
		
func _on_player_interact(player):
	emit_signal("player_sit", self)
