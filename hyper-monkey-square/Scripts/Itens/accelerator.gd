class_name Accelerator
extends Node2D

@export var add_velocity = 500
@export var add_jump = 300


func _on_first_sprint_body_entered(body: Dino) -> void:
	body.add_velocity(add_velocity)


func _on_second_sprint_body_entered(body: Dino) -> void:
	body.add_impulse(add_jump)
