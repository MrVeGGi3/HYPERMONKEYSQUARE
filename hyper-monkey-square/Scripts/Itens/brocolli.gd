extends Area2D

@onready var brocolli_animation: AnimationPlayer = $BrocolliAnimation

func _on_body_entered(body: Dino) -> void:
	GameManager.brocolli += 1
	brocolli_animation.play("brocolli_catched")
	


func _on_brocolli_animation_animation_finished(anim_name: StringName) -> void:
	queue_free()
