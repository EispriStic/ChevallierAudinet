extends KinematicBody2D

var velocity = Vector2(0,0)
var coins = 0

const SPEED = 400
const JUMPFORCE = -1250
const gravity = 65
func _physics_process(_delta):
	
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -SPEED
		$Sprite.play("walk")
		$Sprite.flip_h = true
		
	else:
		$Sprite.play("idle")
		
#	if not is_on_floor():
#		$Sprite.play("air")
	
	velocity.y += gravity

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
		$soundJump.play()
	
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.20)


func _on_FallZone_body_entered(body):
	get_tree().change_scene("res://Scenes/GameOver/GameOver.tscn")
	

func ouch():
	set_modulate(Color(1,0.3,0.3,1))
	$Timer.start()
#	velocity.y = JUMPFORCE * 0.7



func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/GameOver/GameOver.tscn")
	

func _on_coin_collected():
	$Sprite.play("drink")
