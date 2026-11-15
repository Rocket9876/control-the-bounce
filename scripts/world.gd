extends Node2D



@export var start_force_angles = {"min_angle":0.0,"max_angle":0.0}

@onready var ball = $Ball

var start = false
@export var start_force :float
var start_force_angle



func _ready() -> void:
	$RichTextLabel.text = "STREAK: " + str(global.streak)
	start_force_angle = set_random_start_angle()
	$goal.position = Vector2(randf_range($"goal marker/top left".position.x,$"goal marker/bottem right".position.x),randf_range($"goal marker/top left".position.y,$"goal marker/bottem right".position.y))

# Called every frame. 'delta' is the elapsed time since the previous frame.
var first
func _physics_process(delta: float) -> void:
	if global.editor and Input.is_action_just_pressed("space"):
		ball.freeze = false
		apply_start_force()
		first = true
		$"start stop".text = "STOP"
		$"start stop".focus_mode = false
	if not global.editor and Input.is_action_just_pressed("space") and not first:
		restart()
	first = false
	$Control/editor.visible = global.editor


func set_random_start_angle():
	var angle = deg_to_rad(randf_range(start_force_angles["min_angle"],start_force_angles["max_angle"]))
	ball.arrow.rotation = angle
	return angle

func apply_start_force(angle = start_force_angle):
	ball.arrow.visible = false
	ball.apply_central_impulse(Vector2(-sin(angle),cos(angle)) * start_force)
	global.editor = false
	

func restart():
	$"start stop".text = "START" 
	$"start stop".focus_mode = false
	global.streak = 0
	$RichTextLabel.text = "STREAK: " + str(global.streak)
	global.editor = true
	ball.move_and_collide(Vector2(0,0))
	ball.rotation = 0
	ball.freeze = true
	ball.position = ball.start_position
	ball.arrow.visible = true


func _on_start_stop_pressed() -> void:
	if global.editor:
		ball.freeze = false
		apply_start_force()
		first = true
		$"start stop".text = "STOP"
		$"start stop".focus_mode = false
	else:
		global.queue_restart = true
		$"start stop".text = "START"
		$"start stop".focus_mode = false
