extends CanvasLayer


# Called when the 'quit' button is pressed.
func _on_quit_pressed():
	get_tree().quit()

# Called when the 'play game' button is pressed.
func _on_play_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
