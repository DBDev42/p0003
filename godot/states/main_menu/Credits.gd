extends Panel

# Signals
signal back(menu)

# Enums

# Constants
const SIGNAL_BACK = "back"

# Variables

# Setters and Getters

# Constructors
func _ready():
	$TitleAndMenu/MarginsTitle/Title.text = tr("CREDITSLABEL")
	$TitleAndMenu/MarginsMenu/Credits.text = tr("CREDITS")
	$TitleAndMenu/MarginsButtons/HAlign/Back.text = tr("BACKLABEL")

# Process functions

# Other functions
func _on_Back_button_up():
	emit_signal(SIGNAL_BACK, self)
