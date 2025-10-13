extends AIState
class_name AIWonder


@export var wander_range: float
var home_position: Vector2


func _ready() -> void:
	home_position = $"../..".global_position


func Enter() -> void:
	target_reacheble_position()


func Update(_delta) -> void:
	if chase_area.overlaps_body(character_body.player):
		ChangeStateTo("chase")


func PhysicsUpdate(_delta) -> void:
	if navigation_agent.is_navigation_finished():
		ChangeStateTo("idle")
		return
	
	var direction = character_body.to_local(navigation_agent.get_next_path_position()).normalized()
	
	if direction:
		animation_player.play(
			"run_right" if direction.x > 0 else "run_left"
		)
	
	character_body.velocity = direction * character_body.speed
	character_body.move_and_slide()


func target_reacheble_position() -> void:
	while true:
		navigation_agent.target_position = random_point_in_circle_centered(home_position, wander_range)
		if navigation_agent.is_target_reachable():
			break


func random_point_in_circle_centered(center: Vector2, radius: float) -> Vector2:
	var random_angle = randf() * TAU
	var random_radius = randf() * radius  #Not uniform on purpose
	
	return center + Vector2(
		cos(random_angle) * random_radius,
		sin(random_angle) * random_radius
	)
