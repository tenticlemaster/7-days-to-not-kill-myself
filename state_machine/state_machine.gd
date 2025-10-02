extends Node


@export var starting_state: State
var current_state: State


# Use states dictionary so that we only need a state name to use it
var states: Dictionary


func _ready() -> void:
	for child in get_children():
		states[child.name] = child
		child.change_state.connect(_on_change_state)
	
	starting_state.Enter()
	current_state = starting_state


func _process(delta: float) -> void:
	current_state.Update(delta)


func _physics_process(delta: float) -> void:
	current_state.PhysicsUpdate(delta)


func _on_change_state(state: State, new_state_name: String):
	if state != current_state:
		return
	
	current_state.Exit()
	states[new_state_name].Enter()
	current_state = states[new_state_name]
