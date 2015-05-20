extends StaticBody2D

var frontBlock = preload("res://Scripts/Blocks/Block.gd")
var backBlock = preload("res://Scripts/Blocks/Block.gd")
var isFront = true
var surroundingBricks = []

func SetOtherBrick(brick, direction):
	surroundingBricks[direction] = brick
		
func GetOtherBrick(direction):
	return surroundingBricks[direction]
	
func CreateBlocks(frontBlock, backBlock):
	self.frontBlock = frontBlock
	self.backBlock = backBlock
	#set sprites and sizes
	
func Flip():
	if(frontBlock.GetFlippable() && backBlock.GetFlippable()):
		isFront = !isFront
		
#func Rotate()

func UnstickBalls():
	frontBlock.UnstickBalls()
	backBlock.UnstickBalls()
	
func Collide(other):
	print(self.get_name(), " Collided with: ", other.get_name())
	#GetCurrentBlock().Collide(other)
	
func Explode(n):
	GetCurrentBlock().Damage(1)
	GetCurrentBlock().Explode(n)
	
func PlayParticleSystem():
	#play particle system
	pass

func getCurrentBlock():
	if(isFront):
		return frontBlock
	else:
		return backBlock
