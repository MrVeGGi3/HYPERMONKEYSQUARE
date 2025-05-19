extends Node

var phase_dificulty : String #Dificuldade da Fase
var max_brocolli : int = 60 # Quantidade Máxima de Brócolis que podem ser coletados
var brocolli : int = 0 # Quantidade de Brócolis coletados
var actual_level : int # Nível atual que está sendo jogado
var time_to_complete : float #Tempo para o player concluir a fase
var lifes : int = 3
var can_start_timer : bool = false
var player_velocity

@export_group("Saving Elements")
var is_level_concluded : bool #Marcação se a fase foi concluída ou não
var max_score_level : float #Score máximo obtido ao concluír a fase
var time_record : float #Recorde máximo de tempo

@export_group("Time Control Elements")
var seconds
var centisec
var time_passed
var level_finished : bool = false
var time_over : bool = false

@export_group("Score Elements and Calculus")
var clear_ratio : float
var score_multiplier 
var actual_level_score
var total_score : int

func _process(delta: float) -> void:
	if GameManager.can_start_timer:
			time_passed -= delta
			seconds = int(time_passed)
			centisec = int((time_passed - seconds) * 100)
			
			if time_passed <= 0.00:
				time_passed = 0.00
				GameManager.can_start_timer = false
				time_over = true
				
	if lifes <= 0:
		total_score = 0

func _calculate_score():
	print(clear_ratio)
	if clear_ratio <= float(0.125):
		GameManager.score_multiplier = 4
	elif clear_ratio > float(0.125) and clear_ratio <= float(0.25):
		GameManager.score_multiplier = 3
	elif clear_ratio > float(0.25) and clear_ratio <= float(0.5):
		GameManager.score_multiplier = 2
	elif clear_ratio > float(0.5) and clear_ratio <= float(0.66):
		GameManager.score_multiplier = 1.5
	elif clear_ratio > float(0.66):
		GameManager.score_multiplier = 1.0 
		
	print("O Multiplicador é de", GameManager.score_multiplier)
	
