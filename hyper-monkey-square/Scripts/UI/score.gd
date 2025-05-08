extends Control
@onready var total_score_label: Label = $TotalScoreLabel

func _process(delta: float) -> void:
	total_score_label.text = str(GameManager.total_score)
