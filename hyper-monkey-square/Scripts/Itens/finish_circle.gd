extends Area2D

@onready var level_animator: AnimationPlayer = $"../MainUi/LevelStart"


func _on_body_entered(body: Dino) -> void:
	GameManager.can_start_timer = false
	GameManager.level_finished = true
	level_animator.play("GOAL")
	
