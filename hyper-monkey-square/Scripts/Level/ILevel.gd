##Interface para configuração de Níveis
class_name Levels
extends Node

var level_number : int 
var brocolli_collected : int
var score_level : int
var time_record : float
var max_time : float
var phase_concluded : bool 
var difficulty : String
var clear_score : int 

signal level_finished

var is_lf_signal_emmited = false
var is_time_over_emmited = false

@onready var level_animator: AnimationPlayer
@onready var dino: Dino = get_tree().get_first_node_in_group("Dino")

func Save():
	var path = "user://level%d.json" % level_number
	var data = {
		"number_level" : level_number,
		"level_score" : score_level,
		"record_timer" : time_record,
		"phase_concluded?" : phase_concluded	
	}
	var jsonData = JSON.stringify(data)
	var jsonFile = FileAccess.open(path, FileAccess.WRITE)
	jsonFile.store_line(jsonData)
	jsonFile.close()

func Load():
	pass

##Constructor to add Main Level traits
func set_level_status(l_number: int, diff : String, l_score : float, t_max : float):
	level_number = l_number
	difficulty = diff
	score_level = l_score
	max_time = t_max

##Update GameManager initial settings before run
func updateGameManagerStatus():
	GameManager.time_over = false
	GameManager.is_level_concluded = false
	GameManager.actual_level_score = score_level
	GameManager.actual_level = level_number
	GameManager.phase_dificulty = difficulty
	GameManager.time_to_complete = max_time
	GameManager.time_passed = GameManager.time_to_complete


##Check if the player goes out of the maximum height to be considered dead
func check_overfall_status(height : float):
	if dino.position.y > height:
		dino.die()
##Check if the level is concluded and set the calculus of score
func check_level_conclusion():
	if GameManager.is_level_concluded:
		time_record = max_time - GameManager.time_passed
		phase_concluded = true
		GameManager.clear_ratio = (time_record/max_time)
		if !is_lf_signal_emmited:
			emit_signal("level_finished")
		Save()
##Check if the time is over
func check_time_over():
	if GameManager.time_over and !is_time_over_emmited:
		emit_signal("is_time_over")
		level_animator.play("TIMEOVER")
		is_time_over_emmited = true
