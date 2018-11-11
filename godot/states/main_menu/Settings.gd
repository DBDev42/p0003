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
	$TitleAndMenu/MarginsTitle/Title.text = tr("SETTINGSLABEL")
	$TitleAndMenu/MarginsMenu/Language/VAlign/Section.text = tr("SETTINGSLANGUAGE")
	$TitleAndMenu/MarginsMenu/Language/VAlign/ES.text = tr("SETTINGSLANGUAGEES")
	$TitleAndMenu/MarginsMenu/Language/VAlign/EN.text = tr("SETTINGSLANGUAGEEN")
	$TitleAndMenu/MarginsButtons/HAlign/Back.text = tr("BACKLABEL")

# Process functions

# Other functions
func _on_Back_button_up():
	emit_signal(SIGNAL_BACK, self)

func _on_ES_button_up():
	Settings.set_setting(Settings.APP_SECTION, Settings.APP_SETTING_LANGUAGE, "es")
	TranslationServer.set_locale("es")

func _on_EN_button_up():
	Settings.set_setting(Settings.APP_SECTION, Settings.APP_SETTING_LANGUAGE, "en")
	TranslationServer.set_locale("en")
