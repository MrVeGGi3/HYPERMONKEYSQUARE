extends Area2D

@onready var level_animator: AnimationPlayer = %LevelStart

func _on_body_entered(body: Dino) -> void:
	body.on_level_finished()
	GameManager.is_level_concluded = true 
	GameManager.can_start_timer = false
	level_animator.play("GOAL")
