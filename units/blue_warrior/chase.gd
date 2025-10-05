extends State




func _on_player_detection_body_exited(_body: Player) -> void:
	ChangeStateTo("Idle")
