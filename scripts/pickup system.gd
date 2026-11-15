extends StaticBody2D

var mouse_in = false

var picked_up = false

var pickup_system = true

var mouse_offset

var saved_position

@export var deletable = true

func _physics_process(delta: float) -> void:
	if pickup_system and global.editor:
		picking()
		deleting()

func _on_mouse_entered() -> void:
	mouse_in = true


func _on_mouse_exited() -> void:
	mouse_in = false

func picking():
	if ((mouse_in and Input.is_action_just_pressed("click")) or (picked_up and Input.is_action_pressed("click"))) and (global.current_mouse_item == null or global.current_mouse_item == self):
		if mouse_offset == null:
			mouse_offset = get_global_mouse_position() - position
		picked_up = true
		position = -Vector2(mouse_offset.x - get_global_mouse_position().x,mouse_offset.y - get_global_mouse_position().y)
		global.current_mouse_item = self
	else:
		picked_up = false
		if global.current_mouse_item == self:
			global.current_mouse_item = null
			mouse_offset = null

func deleting():
	if deletable and mouse_in and Input.is_action_just_pressed("right click") and not picked_up:
		self.queue_free()
