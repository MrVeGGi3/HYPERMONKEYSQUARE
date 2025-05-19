class_name Platform
extends TileMapLayer

@export_range(10,400,5)
var height_range : int
@export_range(10,1000,5)
var radius_range : int
@export_range(10,400,10)
var speed : float = 100
@export_range(0.1,2,0.1)
var angle_speed = 0.1
@export 
var minimal_erro : float = 3.0

var first_point
var second_point
var next_position
var circle_center : Vector2
var angle : float

var going_up = false
var going_left = false
var going_diag = false

enum DirectionType
{
	##The platform moves upside and downside
	UPDOWN,
	##The platform moves to left and right
	LEFTRIGHT,
	##The platform moves up-left and doww-right
	DIAGONALLEFT,
	##The platform moves up-right and down-left
	DIAGONALRIGHT,
	##The platform moves in clock side circular movement
	C_CIRCULAR,
	##The platform moves in counterclock side circular movement
	COUNTER_C_CIRCULAR
}

##Type of Direction of Moving Platform
@export var direction_type : DirectionType

func _ready() -> void:
	_check_direction_type(direction_type)
	print("Chequei o tipo de direction")
	
func _physics_process(delta: float) -> void:
	if direction_type == DirectionType.UPDOWN:
		update_move_down_movement()
	elif direction_type == DirectionType.LEFTRIGHT:
		update_left_right_movement()
	elif direction_type == DirectionType.DIAGONALLEFT:
		update_diagonal_left_movement()
	elif direction_type == DirectionType.DIAGONALRIGHT:
		update_diagonal_right_movement()
	elif direction_type == DirectionType.C_CIRCULAR:
		update_circular_clockwise_movement()
	elif direction_type == DirectionType.COUNTER_C_CIRCULAR:
		update_circular_c_clockwise_movement()
			

func _check_direction_type(t_direction):
	match t_direction:
		DirectionType.UPDOWN:
			set_up_down_behaviour()		
		DirectionType.LEFTRIGHT:
			set_left_right_behaviour()
		DirectionType.DIAGONALLEFT:
			set_diagonal_left_behaviour()
		DirectionType.DIAGONALRIGHT:
			set_diagonal_right_behaviour()
		DirectionType.C_CIRCULAR:
			set_circular_behaviour()
		DirectionType.COUNTER_C_CIRCULAR:
			set_circular_behaviour()
			
			
func set_up_down_behaviour():
	first_point = Vector2(global_position.x, global_position.y + height_range)
	second_point = Vector2(global_position.x, global_position.y - height_range)
	next_position = first_point
func set_left_right_behaviour():
	first_point = Vector2(global_position.x + radius_range, global_position.y)
	second_point = Vector2(global_position.x - radius_range, global_position.y)
	next_position = first_point
func set_diagonal_left_behaviour():
	first_point = global_position + Vector2(-radius_range, -height_range)
	second_point = global_position + Vector2(radius_range, height_range)
	next_position = first_point
	
func set_diagonal_right_behaviour():
	first_point = global_position + Vector2(radius_range, -height_range)
	second_point = global_position + Vector2(-radius_range, height_range)
	next_position = first_point
	
func set_circular_behaviour():
	circle_center = Vector2(global_position.x + radius_range, global_position.y)
	
	
	
func update_move_down_movement():
	print("Posição global é", global_position.y)
	print("Posição alvo é",  next_position.y)
	
	var direction = (next_position - Vector2(0, global_position.y)).normalized()
	if global_position.distance_to(next_position) > minimal_erro:
		if global_position.y < next_position.y:
			global_position.y += speed * get_physics_process_delta_time()
		elif global_position.y > next_position.y:
			global_position.y -= speed * get_physics_process_delta_time()
	else:
		going_up = !going_up
	
	check_changing_direction(going_up)
	
func update_left_right_movement():
	if global_position.distance_to(next_position) >=  minimal_erro:
		if global_position.x < next_position.x:
			global_position.x += speed * get_physics_process_delta_time()
		elif global_position.x > next_position.x:
			global_position.x -= speed * get_physics_process_delta_time()
	else:
		going_left = !going_left	
			
	check_changing_direction(going_left)
		
func update_diagonal_left_movement():
	var direction = (next_position - global_position).normalized()
	if global_position.distance_to(next_position) >= minimal_erro:
			global_position += direction * speed * get_physics_process_delta_time()
	else:
		going_diag = !going_diag
	check_changing_direction(going_diag)	
	
func update_diagonal_right_movement():
	var direction = (next_position - global_position).normalized()
	if global_position.distance_to(next_position) > minimal_erro:
			global_position += direction * speed * get_physics_process_delta_time()
	else:
		going_diag = !going_diag		
	check_changing_direction(going_diag)
	
func update_circular_clockwise_movement():
	angle += angle_speed * get_physics_process_delta_time()
	global_position = circle_center + Vector2(cos(angle), sin(angle)) * radius_range
func update_circular_c_clockwise_movement():
	angle -= angle_speed * get_physics_process_delta_time()
	global_position = circle_center + Vector2(cos(angle), sin(angle)) * radius_range

func check_changing_direction(bool_type : bool):
	if bool_type:
		next_position = second_point
	else:
		next_position = first_point
