extends Node

# Signals
signal language_selected(language)

# Enums

# Constants
const SIGNAL_LANGUAGE_SELECTED = "language_selected"

# Variables

# Setters and Getters

# Constructors

# Process functions

# Other functions
func _on_EN_button_up():
	Settings.set_setting(Settings.APP_SECTION, Settings.APP_SETTING_LANGUAGE, "en")
	emit_signal(SIGNAL_LANGUAGE_SELECTED, "en")

func _on_ES_button_up():
	Settings.set_setting(Settings.APP_SECTION, Settings.APP_SETTING_LANGUAGE, "es")
	emit_signal(SIGNAL_LANGUAGE_SELECTED, "es")
