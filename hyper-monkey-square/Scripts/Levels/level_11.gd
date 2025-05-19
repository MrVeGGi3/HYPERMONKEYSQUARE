extends Levels

@onready var moving_platform: Platform = $MovingPlatforms/MovingPlatform

func _ready() -> void:
	set_level_status(11, "Expert", 2500, 30.0)
	updateGameManagerStatus()


func _process(delta: float) -> void:
	check_level_conclusion()
	check_time_over()
	check_overfall_status(700.00)
	
	if GameManager.can_start_timer:
		moving_platform.set_physics_process(true)
	else:
		moving_platform.set_physics_process(false)
