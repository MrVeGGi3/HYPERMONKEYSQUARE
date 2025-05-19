extends Levels

@onready var moving_platform: Platform = $MovingPlatform/MovingPlatform
@onready var moving_platform_6: Platform = $MovingPlatform/MovingPlatform6


func _ready() -> void:
	set_level_status(10, "Advanced", 2500, 40)
	updateGameManagerStatus()

func _process(delta: float) -> void:
	check_level_conclusion()
	check_time_over()
	check_overfall_status(700.00)
	
	if GameManager.can_start_timer:
		moving_platform.set_physics_process(true)
	else:
		moving_platform.set_physics_process(false)
	
	if GameManager.is_level_concluded:
		moving_platform_6.set_physics_process(false)
	else:
		moving_platform_6.set_physics_process(true)
		

	
