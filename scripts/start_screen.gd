extends Control




func _on_easy_pressed() -> void:
	global.limits = {"boost":1,"platform":5,"vertical platform":3}
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_hard_pressed() -> void:
	global.limits = {"boost":1,"platform":3,"vertical platform":1}
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_check_button_toggled(toggled_on: bool) -> void:
	global.screenshots = toggled_on
