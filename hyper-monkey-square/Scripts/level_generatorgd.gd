extends Node


var slot_data = "res://Data/gameStatus.json"

@export_group("Begginer Level")
const LVL_1 = "res://Scenes/Levels/Begginer/Level_1.tscn"
const LVL_2 = "res://Scenes/Levels/Begginer/Level_2.tscn"
const LVL_3 = "res://Scenes/Levels/Begginer/Level_3.tscn"
const LVL_4 = "res://Scenes/Levels/Begginer/Level_4.tscn"
const LVL_5 = "res://Scenes/Levels/Begginer/Level_5.tscn"
@onready var begginer_phases = [LVL_1, LVL_2, LVL_3, LVL_4, LVL_5]

@export_group("Advanced Level")
const LVL_6 = "res://Scenes/Levels/Advanced/Level_6.tscn"
const LVL_7 = "res://Scenes/Levels/Advanced/Level_7.tscn"
const LVL_8 = "res://Scenes/Levels/Advanced/Level_8.tscn"
const LVL_9 = "res://Scenes/Levels/Advanced/Level_9.tscn"
const LVL_10 = "res://Scenes/Levels/Advanced/Level_10.tscn"
@onready var advanced_phases = [LVL_6, LVL_7, LVL_8, LVL_9, LVL_10]

@export_group("Expert Level")
const LVL_11 = "res://Scenes/Levels/Expert/Level_11.tscn"
const LVL_12 = "res://Scenes/Levels/Expert/Level_12.tscn"
const LVL_13 = "res://Scenes/Levels/Expert/Level_13.tscn"
const LVL_14 = "res://Scenes/Levels/Expert/Level_14.tscn"
const LVL_15 =  "res://Scenes/Levels/Expert/Level_15.tscn"
@onready var expert_level = [LVL_11, LVL_12, LVL_13, LVL_14, LVL_15]

@export_group("Master Level")
const LVL_16 = "res://Scenes/Levels/Master/Level_16.tscn"
const LVL_17 = "res://Scenes/Levels/Master/Level_17.tscn"
const LVL_18 = "res://Scenes/Levels/Master/Level_18.tscn"
const LVL_19 = "res://Scenes/Levels/Master/Level_19.tscn"
const LVL_20 = "res://Scenes/Levels/Master/Level_20.tscn"
@onready var master_level = [LVL_16, LVL_17, LVL_18, LVL_19, LVL_20]


func _save():
	var data = {
		"dificulty": GameManager.phase_dificulty,
		"level_status":
			{
				"level_number" : GameManager.actual_level,
				"level_concluded": GameManager.is_level_concluded,
				"time_record": GameManager.time_record,
				"max_score_level": GameManager.max_score_level,	
			},
		}
		
	var jsonData = JSON.stringify(data)
	var jsonFile = FileAccess.open(slot_data, FileAccess.WRITE)
	jsonFile.store_line(jsonData)
	jsonFile.close()

func _load():
	var jsonFile = FileAccess.open(slot_data, FileAccess.READ)
	var jsonData = jsonFile.get_as_text()
	jsonFile.close()
	var data = JSON.parse_string(jsonData)
	
	GameManager.actual_level = data.level_status.level_number
	GameManager.phase_dificulty = data.dificulty
	GameManager.time_record = data.level_status.time_record
	GameManager.max_score_level = data.level_status.max_score_level
	
	
	
