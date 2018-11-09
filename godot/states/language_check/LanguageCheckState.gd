extends "res://states/State.gd"

# Signals

# Enums

# Constants
const NAME = "language_check"
const END_LANGUAGE_CHECKED = "language_checked"
const _LANGUAGE_SELECTOR = preload("res://states/language_check/LanguageSelector.tscn")

# Variables
var _language_selector = null

# Setters and Getters

# Constructors

# Process functions

# Other functions
func run():
	var language = Settings.get_setting(Settings.APP_SECTION, Settings.APP_SETTING_LANGUAGE)
	if language != null:
		TranslationServer.set_locale(language)
		OS.set_window_title(tr("TITLE"))
		emit_signal(SIGNAL_END, self, END_LANGUAGE_CHECKED)
	else:
		_language_selector = _LANGUAGE_SELECTOR.instance()
		_language_selector.connect(_language_selector.SIGNAL_LANGUAGE_SELECTED, self, "language_selected")
		StateMachine.root_node.add_child(_language_selector)

func language_selected(language):
	Settings.set_setting(Settings.APP_SECTION, Settings.APP_SETTING_LANGUAGE, language)
	TranslationServer.set_locale(language)
	OS.set_window_title(tr("TITLE"))
	StateMachine.root_node.remove_child(_language_selector)
	_language_selector.queue_free()
	emit_signal(SIGNAL_END, self, END_LANGUAGE_CHECKED)