extends State


@onready var animation_player := $"../../AnimationPlayer"


func Enter() -> void:
	animation_player.play("idle")


func Update(_delta) -> void:
	if Input.get_vector("left", "right", "up", "down"):
		ChangeStateTo("run")


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		ChangeStateTo("attack")
