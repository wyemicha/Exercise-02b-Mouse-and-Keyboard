extends Node2D

var midpoint = 0
var margin = 3
var rot_amount = 0.01
var acc_amount = 0.02
var velocity = Vector2(0,0)
var min_range = Vector2(0,0)
var max_range = Vector2(0,0)

func _ready():
	max_range = get_viewport().size

func _physics_process(delta):
	var r = get_viewport().get_mouse_position().x
	midpoint = position.x
	if abs(r - midpoint) > margin:
		rotation_degrees += (r - midpoint)*rot_amount
	velocity += get_input()*acc_amount
	position += velocity
	position.x = clamp(position.x,min_range.x,max_range.x)
	position.y = clamp(position.y,min_range.y,max_range.y)

func get_input():
	var input_dir = Vector2(0,0)
	if Input.is_action_pressed("up"):
		input_dir.y -= 1
	if Input.is_action_pressed("down"):
		input_dir.y += 1
	if Input.is_action_pressed("left"):
		input_dir.x -= 1
	if Input.is_action_pressed("right"):
		input_dir.x += 1
	return input_dir.rotated(rotation)
