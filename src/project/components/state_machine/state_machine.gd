extends Node
class_name StateMachine


@export var starting_state: State
var current_state: State
var states: Dictionary
signal state_changed(new_state_name: String)


func _ready() -> void:
	for child: State in get_children():
		states[child.name.to_lower()] = child
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
	
	var new_lowercase_state_name = new_state_name.to_lower()
	
	current_state.Exit()
	states[new_lowercase_state_name].Enter()
	current_state = states[new_lowercase_state_name]
	
	state_changed.emit(new_lowercase_state_name)
