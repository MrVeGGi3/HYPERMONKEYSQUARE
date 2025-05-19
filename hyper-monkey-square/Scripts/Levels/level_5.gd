extends Levels

func _ready() -> void:
	set_level_status(5, "Begginer", 2000, 30)
	updateGameManagerStatus()
	
func _process(delta: float) -> void:
	check_level_conclusion()
	check_overfall_status(700.00)
	check_time_over()
