extends StateMachine
class_name AIStateMachine


@export var animation_player: AnimationPlayer
@export var animation_tree: AnimationTree
@export var sprite: Sprite2D
@export var character_body: AIBody
@export var navigation_agent: NavigationAgent2D
@export var chase_area: Area2D
@export var attack_area: Area2D


func _ready() -> void:
	for child: AIState in get_children():
		child.animation_player = animation_player
		child.animation_tree = animation_tree
		child.sprite = sprite
		child.character_body = character_body
		child.navigation_agent = navigation_agent
		child.chase_area = chase_area
		child.attack_area = attack_area
	
	super()
