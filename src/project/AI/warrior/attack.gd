extends AIState


func Enter() -> void:
	if !sprite.flip_h:
		animation_player.play("attack_right")
	else:
		animation_player.play("attack_left")


func _on_animation_finished() -> void:
	ChangeStateTo("idle")
