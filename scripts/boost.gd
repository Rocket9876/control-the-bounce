extends "res://scripts/pickup system.gd"

@export var power:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body) -> void:
	
	if body.is_in_group("ball"):
		body.apply_central_impulse(Vector2(power,0))


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
