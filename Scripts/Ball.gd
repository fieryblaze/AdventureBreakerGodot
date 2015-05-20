
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _integrate_forces(state):
	for x in range(state.get_contact_count()):
		state.get_contact_collider_object(x).Collide(self)

func _ready():
	self.set_linear_velocity(Vector2(20,-100))
	print(self.get_linear_velocity())


