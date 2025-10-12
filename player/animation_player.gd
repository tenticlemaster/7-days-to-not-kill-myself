extends AnimationPlayer


var state_name: String


func _process(_delta: float) -> void:
	play_matching_animation()


func left_or_right() -> String:
	var axis = Input.get_axis("left", "right")
	if !axis:
		return ""
	if axis < 0:
		return "_left"
	else:
		return "_right"


func play_matching_animation() -> void:
	match state_name:
		"idle":
			play("idle")
		"run":
			play("run" + left_or_right())
		"attack":
			if !current_animation.begins_with("attack"):
				play("attack" + left_or_right())


func _on_state_machine_state_changed(new_state_name: String) -> void:
	state_name = new_state_name
	
	play_matching_animation()
