extends Control
@onready var clear_score: Label = $ClearScore
@onready var time_score: Label = $TimeScore
@onready var floor_score: Label = $FloorScore


func _process(delta: float) -> void:
	if GameManager.level_finished:
		clear_score.text = str(GameManager.actual_level_score)
		time_score.text = "x" + str(GameManager.score_multiplier)
		if GameManager.score_multiplier and GameManager.actual_level_score:
			floor_score.text = str(int(GameManager.actual_level_score * GameManager.score_multiplier))
