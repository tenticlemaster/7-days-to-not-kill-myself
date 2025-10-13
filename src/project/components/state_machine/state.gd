extends Node
class_name	State


signal change_state


func _ready() -> void:
	pass


func Enter() -> void:
	pass


func Exit() -> void:
	pass


func Update(_delta) -> void:
	pass


func PhysicsUpdate(_delta) -> void:
	pass


func ChangeStateTo(state_name: String):
	change_state.emit(self, state_name)
