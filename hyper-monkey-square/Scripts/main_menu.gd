extends Control

const LVL_1 = "res://Scenes/Levels/Begginer/Level_1.tscn"




func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file(LVL_1)
