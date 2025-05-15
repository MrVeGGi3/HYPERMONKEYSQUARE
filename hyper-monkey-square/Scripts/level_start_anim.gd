extends AnimationPlayer

@onready var level_animator: AnimationPlayer = $"."
@onready var level_generator: Node = $"../../LevelGenerator"

func _ready() -> void:
	if GameManager.lifes > 2:
		play("level_start")
		print("Estou executando a animação level_start")
	elif GameManager.lifes <= 2:
		play("READY")
		print("Estou executando a animação Ready")
	
func _on_animation_finished(anim_name: StringName) -> void:
	if anim_name == "level_start":
		play("READY")
	elif anim_name == "READY":
		play("GO")
	elif anim_name == "GO":
		GameManager.can_start_timer = true
	elif anim_name == "GOAL":
		GameManager._calculate_score()
		play("SCORE")
	elif anim_name == "SCORE":
		level_generator.selectNextLevel(GameManager.actual_level)
	elif anim_name == "TIMEOVER":
		GameManager.lifes -= 1
		get_tree().reload_current_scene()
		

func onGoalReached():
	play("GOAL")


		
