extends TileMapLayer

@export_range(10,100,5)
var height_range : int
@export_range(10,100,5)
var radius_range : int
@export_range(10,200,10)
var speed : float = 100

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
	first_point = global_position.y + height_range
	second_point = global_position.y - height_range
	next_position = first_point
func set_left_right_behaviour():
	first_point = global_position.x + radius_range
	second_point = global_position.x - radius_range
	next_position = first_point
func set_diagonal_left_behaviour():
	var first_point = global_position + Vector2(global_position.x - radius_range, global_position.y + height_range)
	var second_point = global_position
	next_position = first_point
func set_diagonal_right_behaviour():
	var first_point = global_position + Vector2(global_position.x + radius_range, global_position.y - height_range)
	var second_point = global_position
	next_position = first_point
func set_circular_behaviour():
	circle_center = Vector2(global_position.x + radius_range, global_position.y)
	
	
	
func update_move_down_movement():
	var direction = (next_position - global_position.y).normalized()
	if global_position.y != next_position:
		if global_position.y < next_position:
			position.y += speed * get_physics_process_delta_time()
		elif global_position.y > next_position:
			position.y -= speed * get_physics_process_delta_time()
	else:
		going_up = !going_up
	
	if going_up:
		next_position = second_point
	else:
		next_position = first_point
func update_left_right_movement():
	var direction = (next_position - global_position.x).normalized()
	if global_position.x != next_position:
		if global_position.x < next_position:
			position.x += speed * get_physics_process_delta_time()
		elif global_position.x > next_position:
			position.x -= speed * get_physics_process_delta_time()
	else:
		going_left = !going_left
			
	if going_left:
		next_position = second_point
	else:
		next_position = first_point		
func update_diagonal_left_movement():
	var direction = (next_position - global_position).normalized()
	if global_position != next_position:
		if global_position < next_position:
			position -= Vector2(speed,speed) * get_physics_process_delta_time()
		elif global_position.x > next_position:
			position += Vector2(speed, speed) * get_physics_process_delta_time()
	else:
		going_diag = !going_diag
			
	if going_diag:
		next_position = second_point
	else:
		next_position = first_point
func update_diagonal_right_movement():
	var direction = (next_position - global_position).normalized()
	if global_position != next_position:
		if global_position < next_position:
			position += Vector2(speed,speed) * get_physics_process_delta_time()
		elif global_position.x > next_position:
			position -= Vector2(speed, speed) * get_physics_process_delta_time()
	else:
		going_diag = !going_diag
			
	if going_diag:
		next_position = second_point
	else:
		next_position = first_point
func update_circular_clockwise_movement():
	angle += speed * get_physics_process_delta_time()
	position = circle_center + Vector2(cos(angle), sin(angle)) * radius_range
func update_circular_c_clockwise_movement():
	angle -= speed * get_physics_process_delta_time()
	position = circle_center + Vector2(cos(angle), sin(angle)) * radius_range
