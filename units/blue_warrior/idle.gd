extends State


@onready var wonder_timer := Timer.new()


func _ready() -> void:
	add_child(wonder_timer)
	wonder_timer.timeout.connect(_on_timer_timeout)


func Enter() -> void:
	animation_player.play("idle")
	
	wonder_timer.start(randi_range(1, 3))


func Exit() -> void:
	wonder_timer.stop()


func _on_timer_timeout() -> void:
	ChangeStateTo("wonder")


func _on_player_detection_body_entered(_body: Player) -> void:
	ChangeStateTo("chase")
