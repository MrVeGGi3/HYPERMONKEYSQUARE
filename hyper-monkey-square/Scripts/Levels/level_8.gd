extends Levels

func _ready() -> void:
	set_level_status(8, "Advanced", 2300, 30)
	updateGameManagerStatus()
	

func _process(delta: float) -> void:
	check_level_conclusion()
	check_overfall_status(700.00)
	check_time_over()
