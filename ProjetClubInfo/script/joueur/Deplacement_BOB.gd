extends KinematicBody2D

export var speed = 300
export var jump_speed = 700
export var gravity = 30

var velocity = Vector2()

func _physics_process(_delta):
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed 
	
	velocity.y += gravity 
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor() and Input.is_action_just_pressed("jump") :
		velocity.y = -jump_speed
	
