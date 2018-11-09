extends Node

# Signals
signal level_completed

# Enums

# Constants
const SIGNAL_LEVEL_COMPLETED = "level_completed"

# Variables

# Setters and Getters

# Constructors

# Process functions

# Other functions
func _on_Completed_button_up():
	emit_signal(SIGNAL_LEVEL_COMPLETED)
