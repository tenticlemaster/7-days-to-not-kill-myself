extends State


@export var player: CharacterBody2D
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"


func Enter() -> void:
	animation_player.play("idle")


func Update(_delta) -> void:
	if Input.get_vector("left", "right", "up", "down"):
		ChangeStateTo("run")
