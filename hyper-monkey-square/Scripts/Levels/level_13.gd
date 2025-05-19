extends Levels

func _ready() -> void:
	set_level_status(13, "Expert", 2700, 45)
	updateGameManagerStatus()


func _process(delta: float) -> void:
	check_level_conclusion()
	check_time_over()
	check_overfall_status(700.0)
