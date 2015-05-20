
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var smallPaddleShape
var normalPaddleShape
var largePaddleShape

func Collide(other):
	print(self.get_name(), " Collided with: ", other.get_name())

func _ready():
	normalPaddleShape = get_shape(0)
	smallPaddleShape = get_shape(1)
	largePaddleShape = get_shape(2)
	clear_shapes()
	add_shape(normalPaddleShape)
