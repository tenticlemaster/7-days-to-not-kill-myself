extends State


@export var animation_player: AnimationPlayer


func Enter() -> void:
	animation_player.play("attack")


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	ChangeStateTo("Idle")
