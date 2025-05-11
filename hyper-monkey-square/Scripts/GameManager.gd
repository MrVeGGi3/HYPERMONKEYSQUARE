extends Node

var phase_dificulty : String #Dificuldade da Fase
var max_brocolli : int = 100 # Quantidade Máxima de Brócolis que podem ser coletados
var brocolli : int = 0 # Quantidade de Brócolis coletados
var actual_level : int # Nível atual que está sendo jogado
var time_to_complete : float #Tempo para o player concluir a fase
var lifes : int = 3
var can_start_timer : bool = false
var total_score : int
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

	
func _process(delta: float) -> void:
	if GameManager.can_start_timer:
			time_passed -= delta
			seconds = int(time_passed)
			centisec = int((time_passed - seconds) * 100)
			
			if time_passed <= 0.00:
				time_passed = 0.00
				GameManager.can_start_timer = false
