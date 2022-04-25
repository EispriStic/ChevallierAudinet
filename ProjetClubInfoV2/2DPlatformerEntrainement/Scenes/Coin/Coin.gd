extends Area2D


signal ajoutPoint
func _on_Coin_body_entered(body):
	
	$AnimationPlayer.play("bounce")
	body.add_coins()
	emit_signal("ajoutPoint")
	
	



func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
