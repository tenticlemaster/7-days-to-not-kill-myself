extends State


@onready var animation_player := $"../../AnimationPlayer"
@onready var player_detection_area := $"../../PlayerDetection"
@onready var player: Player = $"../../../Player"
@onready var wonder_timer := Timer.new()


func _ready() -> void:
	add_child(wonder_timer)
	wonder_timer.timeout.connect(_on_timer_timeout)


func Enter() -> void:
	print("idle")
	animation_player.play("idle")
	
	wonder_timer.start(randi_range(1, 3))


func Update(_delta) -> void:
	if player_detection_area.overlaps_body(player):
		ChangeStateTo("chase")


func Exit() -> void:
	wonder_timer.stop()


func _on_timer_timeout() -> void:
	ChangeStateTo("wonder")
