extends Control
@onready var level_number: Label = $Letters/LevelNumber

func _process(delta: float) -> void:
	level_number.text = str(GameManager.actual_level)
