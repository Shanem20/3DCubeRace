extends Node3D

class_name FinishLine

# Custom signal to indicate the level has been won
signal level_won

# Triggered when physics body enters the AreaD3 this is attached to
func _on_area_3d_body_entered(body):
	level_won.emit() #emits 'level_won'
