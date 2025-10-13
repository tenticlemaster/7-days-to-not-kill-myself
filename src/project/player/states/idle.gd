extends State


func PhysicsUpdate(_delta) -> void:
	if Input.get_vector("left", "right", "up", "down"):
		ChangeStateTo("run")
	
	if Input.is_action_pressed("attack"):
		ChangeStateTo("attack")
