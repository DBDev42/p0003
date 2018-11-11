extends Node

# Signals
signal quit

# Enums

# Constants
const SIGNAL_QUIT = "quit"

# Variables

# Setters and Getters

# Constructors
func _ready():
	$UI/Margins/VAlign/Thanks.text = tr("QUITTHANKS")

# Process functions

# Other functions

func _on_VisibleTime_timeout():
	emit_signal(SIGNAL_QUIT)
