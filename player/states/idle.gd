extends PlayerState


func Enter() -> void:
	animation_player.play("idle", -1, 1.0)


func Update(_delta) -> void:
	if Input.get_vector("left", "right", "up", "down"):
		ChangeStateTo("run")


func PhysicsUpdate(_delta) -> void:
	return
	player.velocity = player.velocity.move_toward(
		Vector2.ZERO,
		player.friction * _delta
	)
	player.move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		ChangeStateTo("attack")
