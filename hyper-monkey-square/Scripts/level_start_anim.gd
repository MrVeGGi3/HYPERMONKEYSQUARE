extends AnimationPlayer


func _ready() -> void:
	play("level_start")
	
func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "level_start":
		play("READY")
	elif anim_name == "READY":
		play("GO")
	elif anim_name == "GO":
		GameManager.can_start_timer = true
		
