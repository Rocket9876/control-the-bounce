extends RigidBody2D

@export var start_force:float

@export var kill_height:int

@onready var arrow = $Arrow

var start_position

var queue_teleport = false

var queue_restart = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_position = position


func impule_random_direction(min_angle,max_angle,force = start_force):
	var angle = deg_to_rad(randi_range(min_angle,max_angle))
	apply_central_impulse(Vector2(sin(angle),cos(angle)) * force)

func kill_zone():
	if position.y > kill_height:
		get_tree().current_scene.restart()

func _physics_process(delta: float) -> void:
	kill_zone()







func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if position.y < 0:
		global.queue_restart = true
	elif position.x > 0:
		queue_teleport = true

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	if queue_teleport:
		state.transform = Transform2D(rotation,Vector2(0,position.y))
		queue_teleport = false
