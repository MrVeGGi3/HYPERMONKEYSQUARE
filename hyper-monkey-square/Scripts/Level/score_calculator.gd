extends Node

@onready var level = get_tree().get_first_node_in_group("Level") as Levels

func _ready() -> void:
	level.level_finished.connect(calculate_total_score)

func calculate_total_score():
	print("Estou calculando o Score")
	GameManager._calculate_score()
	GameManager.total_score += int(GameManager.score_multiplier * GameManager.actual_level_score)
	level.is_lf_signal_emmited = true
	
