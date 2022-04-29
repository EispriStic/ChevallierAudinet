extends Button



func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Level1/Level1.tscn")


func _on_Quit_pressed():
		get_tree().change_scene("res://Scenes/Menu Titre/titleMenu.tscn")
