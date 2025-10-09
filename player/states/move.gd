extends PlayerState


@export var speed: float = 1000


func PhysicsUpdate(_delta) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if !direction: 
		ChangeStateTo("idle")
		return
	
	animation_player.play("run_right" if direction.x > 0 else "run_left")
	
	#player.velocity = player.velocity.move_toward(
		#direction * player.speed,
		#player.acceleration * _delta
	#)
	
	player.velocity = direction * player.speed
	player.move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		ChangeStateTo("attack")
 
