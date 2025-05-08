extends Area2D




func _on_body_entered(body: Dino) -> void:
	GameManager.can_start_timer = false
	
