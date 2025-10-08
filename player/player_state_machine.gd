extends StateMachine
class_name PlayerStateMachine


@export var animation_player: AnimationPlayer
@export var player: Player


func _ready() -> void:
	for child: PlayerState in get_children():
		child.animation_player = animation_player
		child.player = player
	
	super()
