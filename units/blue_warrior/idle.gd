extends State


@export var chase_state: State
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var wonder_timer: Timer = $WonderTimer


func Enter() -> void:
	animation_player.play("idle")
	
	wonder_timer.start(randi_range(2, 5))


func Exit() -> void:
	wonder_timer.stop()


func _on_player_detection_body_entered(body: Player) -> void:
	chase_state.target = body
	ChangeStateTo("chase")


func _on_wonder_timer_timeout() -> void:
	ChangeStateTo("wonder")
