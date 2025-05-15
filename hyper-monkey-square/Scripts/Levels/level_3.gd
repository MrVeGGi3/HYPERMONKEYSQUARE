extends Levels

func _ready() -> void:
	level_animator = $MainUi/LevelStart
	set_level_status(3, "Begginer", 1200.00, 30.0)
	updateGameManagerStatus()
	
	
func _process(delta: float) -> void:
	check_time_over()
	check_overfall_status(700.00)
	check_level_conclusion()
	
