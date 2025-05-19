extends Levels

func _ready() -> void:
	set_level_status(12, "Expert", 2500, 40)
	updateGameManagerStatus()


func _process(delta: float) -> void:
	check_level_conclusion()
	check_overfall_status(700.0)
	check_time_over()
