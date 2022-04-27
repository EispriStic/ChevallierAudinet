extends Area2D


signal ajoutPoint
signal coin_collected

func _on_Coin_body_entered(body):
	
	emit_signal("ajoutPoint")
	
	emit_signal("coin_collected")
	
	set_collision_mask_bit(0,false)
	
	$SoundRot.play()
	
	body.drink()
	



func _on_SoundRot_finished():
	queue_free()
