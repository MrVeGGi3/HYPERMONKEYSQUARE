extends Levels

func _ready() -> void:
	set_level_status(20, "Master", 3500, 45)
	updateGameManagerStatus()

func _process(delta: float) -> void:
	check_level_conclusion()
	check_overfall_status(800.00)
	check_time_over()
