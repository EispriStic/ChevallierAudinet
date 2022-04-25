extends CanvasLayer

var coins = 0

func _ready():
	$COINS.text = String(coins)

func _on_coin_collected():
	coins += 1
	_ready()
	if coins == 4:
		get_tree().change_scene("res://Scenes/Gagne/Gagne.tscn")

