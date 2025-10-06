extends State


@onready var animation_player := $"../../AnimationPlayer"


func Enter() -> void:
	animation_player.play("idle")


func Update(_delta) -> void:
	if Input.get_vector("left", "right", "up", "down"):
		ChangeStateTo("run")
