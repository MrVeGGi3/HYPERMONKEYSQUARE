extends Control

@onready var level_name_label: Label = $LevelNameLabel
@onready var difficulty_anim_sprite: AnimatedSprite2D = $Difficulty

func _ready() -> void:
	set_difficulty_image()

func _process(delta: float) -> void:
	level_name_label.text = "FLOOR" +" " +  str(GameManager.actual_level)

func set_difficulty_image():
	match GameManager.phase_dificulty:
		"Begginer":
			difficulty_anim_sprite.play("begginer")
		"Advanced":
			difficulty_anim_sprite.play("advanced")
		"Expert":
			difficulty_anim_sprite.play("expert")
		"Master":
			difficulty_anim_sprite.play("master")
			
