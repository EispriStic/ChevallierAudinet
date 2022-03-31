extends Node


# Declare member variables here. Examples:
var santeJoueur = 0
# var b = "text"
var cible = ["test", "test2", 120, "test", "test", "test", 120]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func degat(cible, nbDegat):
	cible[2] = cible[2]-nbDegat
	if cible[2] <= 0:
		miseAMort()

func miseAMort():
	pass

func soin(cible, nbSoins):
	cible[2] = cible[2] + nbSoins
	if cible[2] > cible[6]:
		cible[2] = cible[6]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
