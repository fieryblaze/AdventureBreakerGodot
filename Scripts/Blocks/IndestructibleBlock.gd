
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func destroy():
	self.queue_free()

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	pass
