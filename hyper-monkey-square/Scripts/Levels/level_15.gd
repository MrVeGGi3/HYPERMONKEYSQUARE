extends Levels

func _ready() -> void:
	set_level_status(15, "Expert", 3000, 50)
	updateGameManagerStatus()
	

func _process(delta: float) -> void:
	check_level_conclusion()
	check_time_over()
	check_overfall_status(800.0)
