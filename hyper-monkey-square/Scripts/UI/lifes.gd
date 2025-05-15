extends Control

@onready var life_animation_player: AnimationPlayer = $LifeAnimationPlayer
@onready var change_animation_timer: Timer = $ChangeAnimationTimer
var life_animation : String

@onready var life: Sprite2D = $HBoxContainer/Life
@onready var life_2: Sprite2D = $HBoxContainer/Life2
@onready var life_3: Sprite2D = $HBoxContainer/Life3
@onready var  lifes = [life, life_2, life_3]

func _ready() -> void:
	life_animation_player.play("life_rotation_1")
	life_animation = "rot_1"

func _on_life_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name:
		change_animation_timer.start()
	
func _on_change_animation_timer_timeout() -> void:
	match life_animation:
		"rot_1":
			life_animation_player.play("life_rotation_2")
			life_animation = "rot_2"
		"rot_2":
			life_animation_player.play("life_rotation_1")
			life_animation = "rot_1"

func _process(delta: float) -> void:
	updateLifeAppearence()
	

func updateLifeAppearence():
	if GameManager.lifes == 3:
		for lif in lifes:
			lif.show()
	elif GameManager.lifes == 2:
		for i in range(0,1):
			lifes[i].show()
		lifes[2].hide()	
	elif GameManager.lifes == 1:
		for i in range(1, lifes.size()):
			lifes[i].hide()		
	else:
		for lif in lifes:
			lif.hide()
			
	
	
