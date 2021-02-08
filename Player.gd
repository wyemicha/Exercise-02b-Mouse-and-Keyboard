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

	velocity += get_input()*acc_amount
	position += velocity
	position.x = clamp(position.x,min_range.x,max_range.x)
	position.y = clamp(position.y,min_range.y,max_range.y)

func get_input():
	var input_dir = Vector2(0,0)
	return input_dir.rotated(rotation)
