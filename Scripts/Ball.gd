
extends RigidBody2D

var paddleScript = preload("res://Scripts/paddle.gd")
var brickScript = preload("res://Scripts/Brick.gd")

var magnitude
var startingVelocity = Vector2(500,500)

func _integrate_forces(state):
	for x in range(state.get_contact_count()):
		var colliderObject = state.get_contact_collider_object(x)
		print(colliderObject)
		
		## Enforce perfect bouncing ##
		self.set_linear_velocity(get_linear_velocity().normalized() * magnitude)
		if colliderObject extends brickScript or colliderObject extends paddleScript:
			colliderObject.Collide(self)

func _ready():
	magnitude = sqrt((startingVelocity.x * startingVelocity.x) + (startingVelocity.y * startingVelocity.y))
	self.set_linear_velocity(startingVelocity)
	print(self.get_linear_velocity())


