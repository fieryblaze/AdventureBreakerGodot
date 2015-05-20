
extends Node2D

var map = [[]]

# member variables here, example:
# var a=2
# var b="textvar"
var IndestructibleBlock = preload("res://Scenes/Blocks/IndestructibleBlock.scn")
var BoundaryScene = preload("res://Scenes/game_boundary.scn")
var PaddleScene = preload("res://Scenes/paddle.scn")

var Boundary
var Paddle

var sizeX = 77
var sizeY = 27

func _ready():
	Boundary = BoundaryScene.instance()
	Paddle = PaddleScene.instance()
	self.add_child(Boundary)
	self.add_child(Paddle)
	while(map.size() < 10):
		map.append([])
	for i in range(10):
		while(map[i].size() < 10):
			map[i].append(IndestructibleBlock.instance())
	
	for x in range(10):
		for y in range (10):
			self.add_child(map[x][y])
			map[x][y].set_pos(Vector2((x * sizeX) + (sizeX / 2),(y * sizeY) + (sizeY/2)))
	print(map.size())
	print(map[0].size())
	set_fixed_process(true)

func _fixed_process(delta):
	pass

