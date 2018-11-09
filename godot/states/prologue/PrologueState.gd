extends "res://states/State.gd"

# Signals

# Enums

# Constants
const NAME = "prologue"
const END_PROLOGUE_COMPLETED = "prologue_completed"
const _PROLOGUE_LEVEL = preload("res://states/prologue/Prologue.tscn")

# Variables
var _prologue_level = null

# Setters and Getters

# Constructors

# Process functions

# Other functions
func run():
	var prologue_completed = Settings.get_setting(Settings.PROLOGUE_SECTION, Settings.PROLOGUE_SETTING_COMPLETED)
	if prologue_completed:
		emit_signal(SIGNAL_END, self, END_PROLOGUE_COMPLETED)
	else:
		_prologue_level = _PROLOGUE_LEVEL.instance()
		_prologue_level.connect(_prologue_level.SIGNAL_LEVEL_COMPLETED, self, "level_completed")
		StateMachine.root_node.add_child(_prologue_level)

func level_completed():
	Settings.set_setting(Settings.PROLOGUE_SECTION, Settings.PROLOGUE_SETTING_COMPLETED, true)
	StateMachine.root_node.remove_child(_prologue_level)
	_prologue_level.queue_free()
	emit_signal(SIGNAL_END, self, END_PROLOGUE_COMPLETED)