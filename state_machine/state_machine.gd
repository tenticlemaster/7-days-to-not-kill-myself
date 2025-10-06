class_name StateMachine
extends Node


@export var character_body: CharacterBody2D
@export var animation_player: AnimationPlayer

@export var starting_state: State
var current_state: State

var states: Dictionary


func _ready() -> void:
	for child: State in get_children():
		states[child.name.to_lower()] = child
		child.change_state.connect(_on_change_state)
		
		child.character_body = character_body
		child.animation_player = animation_player
	
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
