extends Control

@onready var dino = get_tree().get_first_node_in_group("Dino") as Dino
@onready var velocimeter_label: Label = $VelocimeterLabel

func _process(delta: float) -> void:
	velocimeter_label.text = str(GameManager.player_velocity)+ " " +  "mps"
