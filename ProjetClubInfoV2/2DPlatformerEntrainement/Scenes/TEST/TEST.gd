extends Sprite

var direction = -1


# Called when the node enters the scene tree for the first time.
func _process(delta):
	
#	rotation_degrees += 1 * direction
#
#	if rotation_degrees > 25 :
#		direction = -1
#	elif rotation_degrees < -25 :
#		direction = 1
	
	position += Vector2(0,1)*direction

	if position < Vector2(0,50) :
		direction = -1
