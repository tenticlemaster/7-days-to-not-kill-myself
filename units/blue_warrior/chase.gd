extends State


@export var speed: float
@onready var animation_player := $"../../AnimationPlayer"
@onready var character_body := $"../.."
@onready var navigation_agent: NavigationAgent2D = $"../../NavigationAgent2D"
@onready var player: Player = $"../../../Player"
@onready var player_detection_area: Area2D = $"../../PlayerDetection"
@onready var sprite := $"../../Sprite2D"
@onready var hitbox: Area2D = $"../../HitBox"


func Enter() -> void:
	print("chase")
	animation_player.play("run")


func Update(_delta) -> void:
	if character_body.to_local(player.global_position).length() < 60:
		ChangeStateTo("attack")


func PhysicsUpdate(_delta) -> void:
	if player_detection_area.overlaps_body(player):
		navigation_agent.target_position = player.position
	
	var direction = Vector2.ZERO
	if !navigation_agent.is_navigation_finished():
		direction = character_body.to_local(navigation_agent.get_next_path_position()).normalized()
	
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	
	character_body.velocity = direction * speed
	character_body.move_and_slide()
	
	if navigation_agent.is_navigation_finished():
		ChangeStateTo("idle")
