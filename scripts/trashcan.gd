extends Node2D

var mouse_in = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if mouse_in and Input.is_action_just_released("click") and Input.is_action_pressed("shift"):
		for i in get_tree().get_nodes_in_group("item"):
			i.queue_free()
	if mouse_in and Input.is_action_just_released("click") and global.current_mouse_item:
		global.current_mouse_item.queue_free()
	visible = global.editor



func _on_static_body_2d_mouse_entered() -> void:
	mouse_in = true


func _on_static_body_2d_mouse_exited() -> void:
	mouse_in = false
