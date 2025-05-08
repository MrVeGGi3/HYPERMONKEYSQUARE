extends Control

@onready var broc_counter_label: Label = $BrocCounterLabel

func _process(delta: float) -> void:
	broc_counter_label.text = str(GameManager.brocolli) + "/" + str(GameManager.max_brocolli)
