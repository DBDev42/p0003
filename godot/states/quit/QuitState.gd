extends "res://states/State.gd"

# Signals

# Enums

# Constants
const NAME = "quit"
const _QUIT = preload("res://states/quit/Quit.tscn")

# Variables
var _quit = null

# Setters and Getters

# Constructors

# Process functions

# Other functions
func run():
	if _quit == null:
		_quit = _QUIT.instance()
		_quit.connect(_quit.SIGNAL_QUIT, self, "quit")
	StateMachine.root_node.add_child(_quit)

func quit():
	StateMachine.root_node.remove_child(_quit)
	StateMachine.quit()