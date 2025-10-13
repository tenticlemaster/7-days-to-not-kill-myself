extends State


func Enter() -> void:
	await get_tree().create_timer(.4).timeout
	ChangeStateTo("idle")
