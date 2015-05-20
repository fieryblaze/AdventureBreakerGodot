
var thisBrick = preload("res://Scripts/Brick.gd")

var health
var isDestructible
var isDamageable
var isFlippable
var isSticky
var isExit
var isDeadly
var isExplodable
var isExploding = false

var score = 5

var balls = []

var UP = 0
var DOWN = 0
var LEFT = 0
var RIGHT = 0

func GetFlippable():
	return isFlippable
	
func SetObject(position, rotation):
	pass
	
func SetTransform(brickScript, rotation):
	thisBrick = brickScript
	var pos = brickScript.get_pos()
	SetObject(pos, rotation)
	#set parent
	
func Collide(other):
	if isSticky:
		#stick
		balls.push_back(other)
	if isDamageable:
		Damage(1)
	if isDeadly:
		other.Destroy()
	if isExit:
		#CompleteLevel
		pass
		
func Damage(dam):
	if isDestructible:
		health -= dam
	if health <= 0:
		DestroyBrick()
		
func UnstickBalls():
	for x in range(balls.size()):
		#balls[x].Unstick()
		#set ball velocity
		pass
	balls.clear()
	
func Explode(n):
	if n > 0 and !isExploding and !isDestructible:
		isExploding = true
		ExplodeBrick(UP, n - 1)
		ExplodeBrick(DOWN, n - 1)
		ExplodeBrick(LEFT, n - 1)
		ExplodeBrick(RIGHT, n - 1)
		
func ExplodeBrick(direction, n):
	if(thisBrick.GetOtherBrick(direction) != null):
		thisBrick.GetOtherBrick(direction).Explode(n)
		
func DestroyBrick():
	thisBrick.UnstickBalls()
	thisBrick.PlayParticleSystem()
	#add score
	if isExplodable:
		 self.Explode(3)
	