class_name  OnOffPlatform
extends MeshInstance2D

@onready var collision_shape_2d: CollisionShape2D = $StaticBody2D/CollisionShape2D
@onready var deactivator_timer: Timer = $DeactivatorTimer
@onready var flip_flop_timer: Timer = $FlipFlopTimer
@onready var on_off_plat_animation: AnimationPlayer = $OnOffPlatAnimation


@export_group("Mesh Size")
@export var length = 200
@export var height = 40


@export_group("Colours")
@export var orange_color : Color = Color("ff2200f9")
@export var no_color : Color = Color("00000000")

var is_activated = true

func _ready() -> void:
	deactivator_timer.start()
	mesh.size = Vector2(length, height)
	collision_shape_2d.shape.size = Vector2(length, height)



func _on_deactivator_timer_timeout() -> void:
	if is_activated:
		on_off_plat_animation.play("flip_flop")
	else:
		change_platform_status()
	
func _on_on_off_plat_animation_animation_finished(anim_name: StringName) -> void:
	change_platform_status()

func change_platform_status():
	if is_activated:
		collision_shape_2d.disabled = true
		modulate = no_color
		deactivator_timer.start()
		is_activated = false
	else:
		collision_shape_2d.disabled = false
		modulate = orange_color
		deactivator_timer.start()
		is_activated = true
	
