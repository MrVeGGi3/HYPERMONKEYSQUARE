extends Node2D

@onready var window: Window = $Window
@onready var select_level_label : Label = $SelectLevel
const LOADING_SCENE = "res://Scenes/LoadingScene.tscn"

var phase_difficulty : String

func _ready() -> void:
	window.hide()
	
func _on_beggineer_level_pressed() -> void:
	difficulty_choosed("Begginer")
func _on_advanced_level_pressed() -> void:
	difficulty_choosed("Advanced")
func _on_expert_level_pressed() -> void:
	difficulty_choosed("Expert")
	

func difficulty_choosed(dificulty):
	select_level_label.hide()
	phase_difficulty = dificulty
	window.show()


func _on_yes_pressed() -> void:
	GameManager.phase_dificulty = phase_difficulty

func _on_no_pressed() -> void:
	window.hide()
	select_level_label.show()
