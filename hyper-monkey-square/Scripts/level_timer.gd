extends Control

@onready var timer_label: Label = $TimerLabel
@onready var timer_centi_label: Label = $TimerCentiLabel
@onready var start_time : float = GameManager.time_to_complete

@onready var timer_bip: AudioStreamPlayer = $TimerBIP

var time_passed
var seconds
var centisec

func _ready() -> void:
	timer_label.text = str(GameManager.time_to_complete)
	timer_centi_label.text = str(00)
	time_passed = start_time

	
func _process(delta: float) -> void:
	if GameManager.can_start_timer:
		timer_label.text = str(GameManager.seconds)
		timer_centi_label.text = str(GameManager.centisec)
		 
			
		
		
