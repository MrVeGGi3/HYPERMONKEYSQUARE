class_name Dino
extends CharacterBody2D


@export_group("Propriedades Físicas do Jogador")
@export_range(10,400,10)
var max_speed : float 
@export_range(0,1,0.1)
var acceleration_rate : float = 0.5
@export_range(0,1,0.1)
var desaceleration_rate : float = 0.3

signal state_changed(state)

enum State
{
	IDLE,
	WALKING,
	HAPPY
}

var current_state = State.IDLE

@onready var eat: AudioStreamPlayer = $Eat


func _physics_process(delta: float) -> void:
	if GameManager.is_level_concluded:
		return
		
	velocity += get_gravity() * delta
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		current_state = State.WALKING
		velocity.x = lerp(velocity.x, max_speed * direction, acceleration_rate)
	else:
		velocity.x = lerp(velocity.x, 0.0, desaceleration_rate)
	
	if velocity.x == 0.0:
		current_state = State.IDLE
	
	move_and_slide()
	emit_signal("state_changed", current_state)

func _process(delta: float) -> void:
	GameManager.player_velocity = get_velocity_x()
	
	if GameManager.can_start_timer:
		set_physics_process(true)
	else:
		if GameManager.is_level_concluded:
			await on_level_finished()
		else:
			set_physics_process(false)
	
		
func get_velocity_x():
	return abs(velocity.x)

func eatSound():
	eat.play()
	
func die():
	GameManager.lifes -= 1
	GameManager.can_start_timer = false
	get_tree().reload_current_scene()

func on_level_finished():
	GameManager.level_finished = true
	current_state = State.HAPPY
	emit_signal("state_changed", current_state)
	set_physics_process(false)
