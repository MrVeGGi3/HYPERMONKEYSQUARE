extends AnimatedSprite2D

@onready var dino = get_parent() as Dino

func _ready() -> void:
	dino.state_changed.connect(_dinoAnimation)
	

func _dinoAnimation(state):
	match state:
		dino.State.IDLE:
			play("idle")
		dino.State.WALKING:
			play("walking")
	
	if dino.velocity.x > 0:
		flip_h = false
	elif dino.velocity.x < 0:
		flip_h = true
		
