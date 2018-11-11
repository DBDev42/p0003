extends Node

# Signals
signal quit

# Enums

# Constants
const _CREDITS = preload("res://states/main_menu/Credits.tscn")
const _SETTINGS = preload("res://states/main_menu/Settings.tscn")
const SIGNAL_QUIT = "quit"

# Variables
var _credits = null
var _settings = null

# Setters and Getters

# Constructors
func _ready():
	$UI/TitleAndMenu/Margins/Title.text = tr("TITLE")
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/New.text = tr("NEWGAMELABEL")
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Continue.text = tr("CONTINUEGAMELABEL")
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Settings.text = tr("SETTINGSLABEL")
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Credits.text = tr("CREDITSLABEL")
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Quit.text = tr("QUITLABEL")

# Process functions

# Other functions
func _on_Credits_button_up():
	if _credits == null:
		_credits = _CREDITS.instance()
		_credits.connect(_credits.SIGNAL_BACK, self, "back")
	disable_main_menu_buttons()
	$UI/TitleAndMenu/Menu/Secondary.add_child(_credits)

func _on_Settings_button_up():
	if _settings == null:
		_settings = _SETTINGS.instance()
		_settings.connect(_settings.SIGNAL_BACK, self, "back")
	disable_main_menu_buttons()
	$UI/TitleAndMenu/Menu/Secondary.add_child(_settings)

func _on_Continue_button_up():
	pass # replace with function body

func _on_New_button_up():
	pass # replace with function body

func _on_Quit_button_up():
	emit_signal(SIGNAL_QUIT)

func back(menu):
	enable_main_menu_buttons()
	$UI/TitleAndMenu/Menu/Secondary.remove_child(menu)

func disable_main_menu_buttons():
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/New.disabled = true
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Continue.disabled = true
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Settings.disabled = true
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Credits.disabled = true
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Quit.disabled = true

func enable_main_menu_buttons():
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/New.disabled = false
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Continue.disabled = false
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Settings.disabled = false
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Credits.disabled = false
	$UI/TitleAndMenu/Menu/Primary/Background/Buttons/Quit.disabled = false