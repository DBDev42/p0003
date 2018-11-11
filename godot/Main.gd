extends Node

# Signals

# Enums

# Constants
const _STATE_LANGUAGE_CHECK = preload("res://states/language_check/LanguageCheckState.gd")
const _STATE_PROLOGUE = preload("res://states/prologue/PrologueState.gd")
const _STATE_MAIN_MENU = preload("res://states/main_menu/MainMenuState.gd")
const _STATE_QUIT = preload("res://states/quit/QuitState.gd")

# Variables

# Setters and Getters

# Constructors
func _ready():
	StateMachine.root_node = $Scenes
	StateMachine.register(_STATE_LANGUAGE_CHECK, _STATE_LANGUAGE_CHECK.END_LANGUAGE_CHECKED, _STATE_PROLOGUE)
	StateMachine.register(_STATE_PROLOGUE, _STATE_PROLOGUE.END_PROLOGUE_COMPLETED, _STATE_MAIN_MENU)
	StateMachine.register(_STATE_MAIN_MENU, _STATE_MAIN_MENU.END_QUIT, _STATE_QUIT)
	StateMachine.start(_STATE_LANGUAGE_CHECK)

# Process functions

# Other functions