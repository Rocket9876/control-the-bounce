extends Node

var current_mouse_item

var editor = true

var streak = 0

var limits = {"boost":0,"platform":0,"vertical platform":0}

var img_save_path = "user://"

var screenshots = true

var queue_restart = false

func _physics_process(delta: float) -> void:
		if queue_restart:
			get_tree().current_scene.restart()
			queue_restart = false
		if Input.is_action_just_pressed("esc"):
			get_tree().change_scene_to_file("res://scenes/start_screen.tscn")
