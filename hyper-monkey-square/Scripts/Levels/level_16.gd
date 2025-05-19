extends Levels

func _ready() -> void:
	set_level_status(16, "Master", 3000, 30)
	updateGameManagerStatus()


func _process(delta: float) -> void:
	check_level_conclusion()
	check_time_over()
	check_overfall_status(700.00)
