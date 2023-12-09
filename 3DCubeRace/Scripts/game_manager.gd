extends Node

@onready var finish_line = $"../FinishLine" as FinishLine
@onready var ui = $"../UI" as UI


var player: Player

# Connects the 'level_won' signal from the finish line to this node's 'on_level_won' method
# Retrieves the first player node found in the "player" group
func _ready():
	finish_line.level_won.connect(on_level_won)
	player = get_tree().get_first_node_in_group("player")

# Stops the player's movement
# Freezes the player to prevent further movement
# Calls UI method to handle level completion
# Unlocks the next level
func on_level_won():
	player.linear_velocity = Vector3.ZERO
	player.freeze = true
	ui.on_level_finished()
	LevelManager.unlock_level(2)
