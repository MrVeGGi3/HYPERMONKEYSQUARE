extends Sprite2D

@onready var seconds_label: Label = $SecondsLabel
@onready var mili_seconds_label: Label = $MiliSecondsLabel

func _process(delta: float) -> void:
	if GameManager.can_start_timer:
		seconds_label.text = str(GameManager.seconds)
		mili_seconds_label.text = str(GameManager.centisec)
			
