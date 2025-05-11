class_name Levels
extends Node

var level_number : int 
var brocolli_collected : int
var score_level : int
var time_record : float
var max_time : float
var phase_concluded : bool 
var difficulty : String


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
	
func updateGameManagerStatus():
	GameManager.actual_level = level_number
	GameManager.phase_dificulty = difficulty
	GameManager.time_to_complete = max_time
	GameManager.time_passed = GameManager.time_to_complete
