extends Levels


func _ready() -> void:
	level_animator = $MainUi/LevelStart
	set_level_status(1, "Begginer", 1000.00, 30.00)
	updateGameManagerStatus()


func _process(delta: float) -> void:
	check_level_conclusion()
	check_overfall_status(588.0)
	check_time_over()
		
