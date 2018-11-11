extends "res://states/State.gd"

# Signals

# Enums

# Constants
const NAME = "main_menu"
const END_QUIT = "quit"
const _MAIN_MENU = preload("res://states/main_menu/MainMenu.tscn")

# Variables
var _main_menu = null

# Setters and Getters

# Constructors

# Process functions

# Other functions
func run():
	if _main_menu == null:
		_main_menu = _MAIN_MENU.instance()
		_main_menu.connect(_main_menu.SIGNAL_QUIT, self, "quit")
	StateMachine.root_node.add_child(_main_menu)

func quit():
	StateMachine.root_node.remove_child(_main_menu)
	_main_menu.queue_free()
	emit_signal(SIGNAL_END, self, END_QUIT)