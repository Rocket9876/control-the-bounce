extends Control

var mouse_in = false

@export_file_path() var element

var item
@export var limit:int
@export var item_scale:float
@export var group_name:String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	item = load(element).instantiate()
	add_child(item)
	item.scale = Vector2(item_scale,item_scale)
	item.position = Vector2($ColorRect.size / 2)
	item.pickup_system = false
	item.z_index = 2
	limit = global.limits[group_name]
	if item is StaticBody2D:
		item.get_node("CollisionShape2D").disabled= true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	creating_new_item()
	
	$ColorRect/RichTextLabel.text = "Available: " + str(limit - get_tree().get_nodes_in_group(group_name).size())


func creating_new_item():
	if mouse_in and Input.is_action_just_pressed("click") and limit - get_tree().get_nodes_in_group(group_name).size() > 0:
		var temp_item = load(element).instantiate()
		get_tree().current_scene.add_child(temp_item)
		temp_item.picked_up = true
		temp_item.add_to_group(group_name)
		temp_item.add_to_group("item")
		temp_item.mouse_offset = Vector2(0,0)



func _on_color_rect_mouse_entered() -> void:
	mouse_in = true




func _on_color_rect_mouse_exited() -> void:
	mouse_in = false
