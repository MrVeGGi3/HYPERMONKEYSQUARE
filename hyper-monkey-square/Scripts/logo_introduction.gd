extends Node2D

@onready var go_to_menu: Timer = $GoToMenu
const MAIN_MENU = "res://Scenes/LevelManagement/MainMenu.tscn"

func _ready() -> void:
	go_to_menu.start()
	
func _on_go_to_menu_timeout() -> void:
	get_tree().change_scene_to_file(MAIN_MENU)
