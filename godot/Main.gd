extends Node

# Signals

# Enums

# Constants
const _STATE_LANGUAGE_CHECK = preload("res://states/language_check/LanguageCheckState.gd")
const _STATE_PROLOGUE = preload("res://states/prologue/PrologueState.gd")

# Variables

# Setters and Getters

# Constructors
func _ready():
	StateMachine.root_node = $Scenes
	StateMachine.register(_STATE_LANGUAGE_CHECK, _STATE_LANGUAGE_CHECK.END_LANGUAGE_CHECKED, _STATE_PROLOGUE)
	StateMachine.start(_STATE_LANGUAGE_CHECK)

# Process functions

# Other functions