extends Node2D

onready var coin1 = $Coin1
onready var coin2 = $Coin2
onready var coin3 = $Coin3
var point = 0
var directionRot = 1
var direction = 1

func _ready():
	coin1.connect("ajoutPoint",self,"addPoint")
	coin2.connect("ajoutPoint",self,"addPoint")
	coin3.connect("ajoutPoint",self,"addPoint")
	
	
func _process(delta):
	
	rotateLevel()
	
func addPoint():
	
	point += 1

func rotateLevel():
	
	if point >= 1 :

		$TileSolid.rotation_degrees += 0.01 * directionRot
		$TileOneWay.rotation_degrees += 0.01 * directionRot
		
		if $TileSolid.rotation_degrees > 5 :
			directionRot = -1
		elif $TileSolid.rotation_degrees < -5 :
			directionRot = 1
