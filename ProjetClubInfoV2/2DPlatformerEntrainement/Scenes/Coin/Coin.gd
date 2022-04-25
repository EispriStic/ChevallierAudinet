extends Area2D


signal ajoutPoint
signal coin_collected

func _on_Coin_body_entered(body):
	
	$AnimationPlayer.play("bounce")
	
	emit_signal("ajoutPoint")
	
	emit_signal("coin_collected")
	
	set_collision_mask_bit(0,false)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
