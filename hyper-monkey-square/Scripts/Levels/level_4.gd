extends Levels

func _ready() -> void:
	set_level_status(4, "Begginer", 1500, 30)
	updateGameManagerStatus()

func _process(delta: float) -> void:
	check_time_over()
	check_overfall_status(700.00)
	check_level_conclusion()
	
