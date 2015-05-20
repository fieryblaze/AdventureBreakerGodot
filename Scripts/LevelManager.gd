
extends Node

const LASTLEVEL = 2

var blockMappingScene = preload("res://Scenes/block_mapping.scn")
var paddleScene = preload("res://Scenes/paddle.scn")
var gameBoundaryScene = preload("res://Scenes/game_boundary.scn")

var blockMapping
var paddle
var gameBoundary

var map

var currentLevelName
var levelLoaded = false

func SetLevel(levelName):
	currentLevelName = levelName
	
func LoadLevel(levelName):
	currentLevelName = levelName
	Load()
	
func Load():
	DeleteCurrentLevel()
	var frontMapping = [[]]#convert file to mapping
	var backMapping = [[]]#convert file to mapping
	
	gameBoundary = gameBoundaryScene.instance()
	blockMapping = blockMappingScene.instance()
	paddle = paddleScene.instance()
	#map = Map()
	
	var ballX = paddle.get_pos().x
	var ballY = paddle.get_pos().y + 32 # + ball width
	var ballPos = Vector2(ballX, ballY)
	
	#paddle.StickBall(ball)
	#give GameController paddle and map objects
	
	levelLoaded = true
	
func LoadNextLevel():
	nextLevel = GetNextLevel()
	if nextLevel == null:
		return false
	LoadLevel(nextLevel)
	return true
	
func DeleteCurrentLevel():
	if !levelLoaded:
		return
	#blockMapping.Destroy()
	#paddle.Destroy()
	#gameBoundary.Destroy()
	
	#destroy all balls
	#destroy explosions
	
	#destroy items
	
	levelLoaded = false
	
func GetNextLevel():
	var levelNum
	#get level num from parsing current name
	#return null if can't parse or past last level
	#increment level and put back as name
	

