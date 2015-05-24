
extends KinematicBody2D

export(float) var rot
export(float) var itemTime
export(float) var maxRotation
export(Color,RGB) var normalColor 
export(Color,RGB) var stickyColor

var pathRef #= preload(#path#)

var sprite

var balls = []

var rotation
var isSticky = false
var pathOn = true
var path
var position = self.get_pos()

var smallPaddleShape
var normalPaddleShape
var largePaddleShape

func ChangeSizeLarge():
	#TimeManager.StartPaddleSizeTime()
	SetCollisionShape(largePaddleShape)
	sprite.set_scale(Vector2(1, 0.5))
	
func ChangeSizeSmall():
	#TimeManager.StartPaddleSizeTime()
	SetCollisionShape(smallPaddleShape)
	sprite.set_scale(Vector2(0.25, 0.5))

func ResetSize():
	sprite.set_scale(Vector2(0.5,0.5))
	
func SetSticky(b):
	if b:
		sprite.set_modulate(stickyColor)
	else:
		sprite.set_modulate(normalColor)
	isSticky = b

func StickBall(ball):
	#stick ball
	balls.append(ball)
	
func UnstickBalls():
	for ball in balls:
		#unstick, then set upward velocity
		pass
	balls.clear()
	
func TogglePath():
	if pathOn:
		PathOff()
	else:
		PathOn()
		
func PathOn():
	path.show()
	pathOn = true
	
func PathOff():
	path.hide()
	pathOn = false
	
func SetPath():
	#set up the paths bounce points and ray casts
	pass
	
func Move(position):
	self.position = position
	
func RotateClockwise():
	SetRotation(rotation - rot)
	
func RotateCounterclockwise():
	SetRotation(rotation + rot)
	
func ResetRotation():
	SetRotation(0)
	
func SetRotation(rotation):
	if (rotation < maxRotation) and (rotation > -maxRotation):
		self.rotation = rotation
		self.set_rot(deg2rad(rotation))
		
func Destroy():
	remove_and_delete_child(path)
	queue_free()
	
func UnparentBalls():
	for ball in balls:
		self.remove_child(ball)
	
func ParentBalls():
	for ball in balls:
		self.add_child(ball)

func Collide(other):
	if isSticky:
		StickBall(other)
	print(self.get_name(), " Collided with: ", other.get_name())

func SetCollisionShape(shape):
	clear_shapes()
	add_shape(shape)

func _ready():
	sprite = self.get_child(0)
	normalPaddleShape = get_shape(0)
	smallPaddleShape = get_shape(1)
	largePaddleShape = get_shape(2)
	SetCollisionShape(normalPaddleShape)
	self.set_process(true)
	#path = pathRef.instance()
	#PathOn()
	#self.hide()
	ResetRotation()

func _process(delta):
	if pathOn:
		SetPath()
	self.move_to(position)
	#if not isPaddleSizeTime, reset size
	
