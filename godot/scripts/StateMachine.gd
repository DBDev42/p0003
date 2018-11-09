extends Node

# Signals

# Enums

# Constants

# Variables
var _state = null
var _config = {}
var root_node = null

# Setters and Getters

# Constructors

# Process functions

# Other functions
func register(state, end, new_state):
	if _config.has(state.NAME):
		_config[state.NAME][end] = new_state
	else:
		_config[state.NAME] = {}
		register(state, end, new_state)

func start(state):
	_state = state.new()
	_state.connect(_state.SIGNAL_END, self, "end")
	_state.run()

func end(state, end):
	if _config.has(state.NAME) and _config[state.NAME].has(end):
		state.queue_free()
		start(_config[state.NAME][end])
	else:
		_state = null