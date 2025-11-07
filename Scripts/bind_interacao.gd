extends AnimatedSprite2D

@export var amplitude: float = 10.0  # altura do movimento
@export var speed: float = 2.0       # velocidade da oscilação


var base_y: float


func _ready() -> void:
	base_y = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = base_y + sin(Time.get_ticks_msec() / 1000.0 * speed) * amplitude
	
	
