extends Node

var ballSpeed = 6.0

const FIRSTLEVEL = "Blah"

var paddleSpeed

var ballRef = preload("res://Scenes/tester.scn") #change to ball.scn
var paddleRef = preload("res://Scenes/paddle.scn")
var gameBoundaryRef = preload("res://Scenes/game_boundary.scn")

var bgMusic
const NORMALPITCH = 1.0
const SLOWPITCH = 0.5
const FASTPITCH = 2.0

var paddle
var gameBoundary

var currentMenu

## Classes ##
var map #= Map()
var timeManager
var levelManager
var menuManager
var scoreManager

var numBalls = 0
var isStickyPaddle = true
var usingMouse = true
var pathOn = true
var mapFlipping = false

func CreateBall(position):
	var tempBall = ballRef.instance()
	tempBall.set_pos(position)
	#Utils.SetRandomVelocityNeg(tempBall, ballSpeed)
	return tempBall
	
func RemoveBall():
	numBalls = numBalls - 1

func AddBall():
	numBalls = numBalls + 1

func CompleteLevel():
	timeManager.NormalTime()
	#menuManager.EnableMenu(MENU.LEVELCOMPLETE)
	
func LoseLevel():
	timeManager.NormalTime()
	#menuManager.EnableMenu(MENU.GAMEOVER)
	
func CompleteGame():
	timeManager.NormalTime()
	print("Game Completed!!!!")
	
func NextLevel():
	scoreManager.CombineScore()
	if !levelManager.LoadNextLevel:
		CompleteGame()
	paddle.SetSticky(isStickyPaddle)
	
func Quit():
	#quit
	pass

func Restart():
	LoadLevel()
	scoreManager.Reset()
	
func SetMusicSpeed(pitch):
	bgMusic.pitch = pitch
	
func LoadLevel():
	levelManager.LoadLevel()
	paddle.setSticky(isStickyPaddle)
	scoreManager.EnableText()
	
func _init():
	#init timeManager, menuManager,scoreManager, levelManager
	levelManager.SetLevel(FIRSTLEVEL)
	LoadLevel()

func _process(delta):
	if mapFlipping:
		if map.Flip():
			mapFlipping = false
			paddle.TogglePath()
			timeManager.UnPause()
			
	#Menu
	if InputManager.ButtonIsDown(INPUT.MENU):
		if menuManager.MenuIsUp(MENU.PAUSE):
			menuManager.DisableMenu()
		else:
			menuManager.EnableMenu(MENU.PAUSE)
			
func _fixed_process(delta):
	if numBalls <= 0:
		LoseLevel()
		
	timeManager.Update()
	
	## Move Paddle ##
	if usingMouse:
		#move paddle to mouse X
		pass
	else:
		#move paddle to button press
		pass
	
	## Rotate Paddle ##
	var rotate = InputManager.GetAxisRaw(INPUT.ROTATION)
	if rotate < 0:
		paddle.RotateCounterclockwise()
	elif rotate > 0:
		paddle.RotateClockwise()
	
	## Flip Map ##
	if InputManager.ButtonIsDown(INPUT.FLIP):
		if !mapFlipping:
			mapFlipping = true
			map.InitFlip()
			map.Flip()
			paddle.TogglePath()
			timeManager.Pause()
			
	## Unstick Balls ##
	if InputManager.ButtonIsDown(INPUT.FIRE):
		paddle.UnstickBalls()
		map.UnstickBalls()
		
	## Toggle Sticky ##
	if InputManager.ButtonIsDown(INPUT.STICKY):
		isStickyPaddle = !isStickyPaddle
		paddle.SetSticky(isStickyPaddle)
		
	## Toggle Ball Path ##
	if InputManager.ButtonIsDown(INPUT.PATH):
		paddle.TogglePath()
		pathOn = !pathOn
#END _fixed_process(delta)