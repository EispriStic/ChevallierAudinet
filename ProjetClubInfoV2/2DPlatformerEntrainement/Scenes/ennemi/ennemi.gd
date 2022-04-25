extends KinematicBody2D

var velocity = Vector2(0,0)
export var direction = -1
export var detectCliff = true

func _ready():
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
		$sideChecker/CollisionShape2D.position.x = $sideChecker/CollisionShape2D.position.x * -1
	$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	$floorChecker.enabled = detectCliff

func _physics_process(delta):
	
	if is_on_wall() or not $floorChecker.is_colliding() and detectCliff and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction
		$sideChecker/CollisionShape2D.position.x = $sideChecker/CollisionShape2D.position.x * direction
	
	velocity.y += 20
	
	velocity.x = 50 * direction
	
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_sideChecker_body_entered(body):
	body.ouch()
	$Soundreperer.play()
