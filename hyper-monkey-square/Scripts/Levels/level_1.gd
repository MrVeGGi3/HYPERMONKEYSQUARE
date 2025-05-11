extends Levels

func _ready() -> void:
	GameManager.is_level_concluded = false
	level_number = 1
	max_time = 30.00
	difficulty = "Begginer"
	updateGameManagerStatus()


func _process(delta: float) -> void:
	if GameManager.is_level_concluded:
		time_record = max_time - GameManager.time_passed
		phase_concluded = true
		Save()
		
