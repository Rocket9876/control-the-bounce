extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body) -> void:
	if body.is_in_group("ball"):
		global.editor = true
		global.streak += 1
		if global.screenshots:
			var img = get_viewport().get_texture().get_image()
			img.save_jpg(OS.get_system_dir(OS.SYSTEM_DIR_PICTURES) + "/control the bounce/" + Time.get_datetime_string_from_system().replace(":", "-") + ".png")
		get_tree().reload_current_scene()
		
