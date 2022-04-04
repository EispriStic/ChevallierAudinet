extends KinematicBody2D

export var speed = 300
export var jump_speed = 700
export var gravity = 30
export var balleVit = 1000
export var balleRate = 0.2


var balle = preload("res://Scenes/joueur/balle.tscn")
var peutTirer = true
var velocity = Vector2()

	# Partie Déplacement 
func _physics_process(_delta):
	move()
	shoot()
	

func shoot():
	
	if Input.is_action_pressed("shoot") and peutTirer == true:
		var balleInstance = balle.instance()
		balleInstance.global_position = $Position2D.global_position
		$".".add_child(balleInstance)
		peutTirer = false
		yield(get_tree().create_timer(balleRate), "timeout")
		peutTirer = true
		
func move():
	velocity.x = (int(Input.is_action_pressed("right")) - int(Input.is_action_pressed("left"))) * speed 
	velocity.y += gravity 
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor() and Input.is_action_just_pressed("jump") :
		velocity.y = -jump_speed

