extends Control

const LEVEL_SELECTOR = "res://Scenes/LevelSelector.tscn"




func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file(LEVEL_SELECTOR)
