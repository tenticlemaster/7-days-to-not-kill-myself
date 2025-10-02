extends State


@export var player: CharacterBody2D


func Enter() -> void:
	player.velocity = Vector2.ZERO


func Update(_delta) -> void:
	if Input.get_vector("left", "right", "up", "down"):
		ChangeStateTo("Move")
