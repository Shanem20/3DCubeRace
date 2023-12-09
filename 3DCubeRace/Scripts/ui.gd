extends CanvasLayer

class_name UI

# References to the UI elements: a Label for the timer and a container for the next level prompt
@onready var label = %Label
@onready var next_level_container = $NextLevelContainer

# Variables to track time passed and whether the timer is stopped
var time_passed = 0
var is_time_stopped = false

# Updates the time display every frame if the timer is not stopped
func _process(delta):
	if !is_time_stopped:
		time_passed += delta
		label.text = "%.2f" % time_passed

# Displays the next level prompt and stops the timer when the level is finished
func on_level_finished():
	next_level_container.visible = true
	is_time_stopped = true

# Changes the scene to the level select screen when the next level button is pressed	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_select.tscn")
