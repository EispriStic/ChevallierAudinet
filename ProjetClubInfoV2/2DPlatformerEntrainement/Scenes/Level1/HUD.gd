extends CanvasLayer

var coins = 0

func _ready():
	$COINS.text = String(coins)

func _physics_process(delta):
	if coins == 4:
		get_tree().change_scene("res://Scenes/Level1/Level1.tscn")

func _on_coin_collected():
	coins += 1
	_ready()
