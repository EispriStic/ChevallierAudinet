extends KinematicBody2D

export var speed = 300
export var jump_speed = 700
export var gravity = 30
export var balleVit = 1000
export var balleRate = 0.2


var balle = preload("res://Scenes/joueur/balle.tscn")
var peutTirer = true
var velocity = Vector2()

func _physics_process(_delta):
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed 
	
	velocity.y += gravity 
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor() and Input.is_action_just_pressed("jump") :
		velocity.y = -jump_speed

	# Partie Shoot
	if Input.is_action_pressed("shoot") and peutTirer == true:
		var balleInstance = balle.instance()
		balleInstance.position = get_global_position()
		balleInstance.apply_impulse(Vector2(),Vector2(balleVit,0).rotated(rotation))
		get_tree().get_root().add_child(balleInstance)
		peutTirer = false
		yield(get_tree().create_timer(balleRate), "timeout")
		peutTirer = true
		
		
		
		
