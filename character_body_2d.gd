extends CharacterBody2D

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var movDir = Vector2(
		Input.get_action_raw_strength("ui_right")-Input.get_action_raw_strength("ui_left"),
		Input.get_action_raw_strength("ui_down")-Input.get_action_raw_strength("ui_up")
	).normalized()
	
	velocity = movDir*speed
	
	move_and_slide()
	
	if(velocity!=Vector2(0,0)):
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame=0
