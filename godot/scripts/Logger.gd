extends Node
## @package Logger
# GDScript for logging the game messages to a file.
# Logs are written in this format YYYY-MM-DD HH24:MI:SS - [DEBUG|INFO|WARN|ERROR] - Message.

# Signals

# Enums
enum LEVELS {DEBUG, INFO, WARN, ERROR}

# Constants
const _FILE_FULL_PATH = "user://p0003.log"
const _LOGGER_SETTING_LEVEL_DEFAULT = WARN
const LEVELS = ["DEBUG", "INFO", "WARN", "ERROR"]

# Variables
## @var _file
# Private file object to access the file.
var _file = null

## @var _level
# Messages with lower priority than this level will not be logged.
# Private access and it's only possible to set up the level.
var _level = _LOGGER_SETTING_LEVEL_DEFAULT setget set_level

# Setters and Getters
## Simple function to set the level.
# If the level is not saved in the configuration file it will be stored with the default value WARN.
# @param level new level to be set
func set_level(level):
	if level in [ERROR, WARN, DEBUG, INFO]:
		info("Setting logger level to " + str(LEVELS[level]))
		_level = level
	else:
		error("Trying to set an invalid level: " + str(level) + ". Setting up default level WARN")
		_level = _LOGGER_SETTING_LEVEL_DEFAULT
		Settings.set_setting(Settings.LOGGER_SECTION, Settings.LOGGER_SETTING_LEVEL, _LOGGER_SETTING_LEVEL_DEFAULT)

# Constructors
## Switch to INFO for indicating that the logging has started and then switch back to the default behaviour.
# The last step is to get the level from the setting's file.
func _init():
	_level = INFO
	_file = File.new()
	if not _file.file_exists(_FILE_FULL_PATH):
		var file_status = _file.open(_FILE_FULL_PATH, File.WRITE)
		if file_status == OK:
			_file.close()
	info("Start logging")
	_level = _LOGGER_SETTING_LEVEL_DEFAULT
	set_level(Settings.get_setting(Settings.LOGGER_SECTION, Settings.LOGGER_SETTING_LEVEL))

# Process functions

# Other functions
## Private method to write in the log file.
# It's write at the end of the file.
# @param message message to be written to the file and printed in the console
func _write(message):
	var datetime = OS.get_datetime()
	if _file != null:
		var file_status = _file.open(_FILE_FULL_PATH, File.READ_WRITE)
		if file_status == OK:
			_file.seek_end()
			_file.store_line("%04d-%02d-%02d %02d:%02d:%02d - " % [datetime["year"], datetime["month"], datetime["day"], datetime["hour"], datetime["minute"], datetime["second"]] + str(message))
			_file.close()
	
	print("%04d-%02d-%02d %02d:%02d:%02d - " % [datetime["year"], datetime["month"], datetime["day"], datetime["hour"], datetime["minute"], datetime["second"]] + str(message))

## Public function to write an error message
# @param message Error's message
func error(message):
	if _level <= ERROR:
		_write("ERROR - " + str(message))

## Public function to write a warning message 
# @param message Warning's message
func warn(message):
	if _level <= WARN:
		_write("wARN - " + str(message))

## Public function to write a debug message
# @param message Debug's message
func debug(message):
	if _level <= DEBUG:
		_write("DEBUG - " + str(message))

## Public function to write an info mesage
# @param message Info's message
func info(message):
	if _level <= INFO:
		_write("INFO - " + str(message))