
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	self.get_child(0).set_linear_velocity(Vector2(20,-50))
	print(self.get_child(0).get_linear_velocity())


