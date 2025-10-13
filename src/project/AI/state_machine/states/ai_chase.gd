extends AIState
class_name AIChase


func PhysicsUpdate(_delta) -> void:
	if attack_area.overlaps_body(character_body.player):
		ChangeStateTo('attack')
	
	if chase_area.overlaps_body(character_body.player):
		navigation_agent.target_position = character_body.player.global_position
	
	if navigation_agent.is_navigation_finished():
		if !chase_area.overlaps_body(character_body.player):
			ChangeStateTo("idle")
	
	if navigation_agent.is_navigation_finished():
		animation_player.play("idle")
		animation_player.stop()
	else:
		var direction = character_body.to_local(
				navigation_agent.get_next_path_position()
			).normalized()
		
		if direction:
			animation_player.play(
				"run_right" if direction.x > 0 else "run_left"
			)
		
		character_body.velocity = direction * character_body.speed
		character_body.move_and_slide()
