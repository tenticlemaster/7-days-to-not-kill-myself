extends AIState
class_name AIIdle


var wonder_timer: Timer


func _ready() -> void:
	wonder_timer = Timer.new()
	add_child(wonder_timer)
	wonder_timer.timeout.connect(_on_timer_timeout)


func Enter() -> void:
	animation_player.play("idle")
	
	wonder_timer.start(randi_range(2, 4))


func Update(_delta) -> void:
	if chase_area.overlaps_body(character_body.player):
		ChangeStateTo("chase")


func Exit() -> void:
	wonder_timer.stop()


func _on_timer_timeout() -> void:
	ChangeStateTo("wonder")
