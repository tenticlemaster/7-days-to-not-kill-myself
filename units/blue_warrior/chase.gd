extends State

@export var speed: float
@onready var player_detection_area: Area2D = $"../../PlayerDetection"
@onready var navigation_agent: NavigationAgent2D = $"../../NavigationAgent2D"
var player: Player


func Enter() -> void:
	animation_player.play("run")


func Update(_delta) -> void:
	if player_detection_area.overlaps_body(player):
		navigation_agent.target_position = player.position


func PhysicsUpdate(_delta) -> void:
	var direction = character_body.to_local(navigation_agent.get_next_path_position()).normalized()
	
	character_body.velocity = direction * speed
	character_body.move_and_slide()


func _on_navigation_agent_2d_navigation_finished() -> void:
	ChangeStateTo("idle")
