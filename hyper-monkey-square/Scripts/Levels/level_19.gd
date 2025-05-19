extends Levels

func _ready() -> void:
	set_level_status(19, "Master", 3500, 30.0)
	updateGameManagerStatus()

func _process(delta: float) -> void:
	check_level_conclusion()
	check_time_over()
	check_overfall_status(700.00)
