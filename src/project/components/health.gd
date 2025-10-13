extends Node
class_name Health


@export var MAX_HEALTH: float
var health: float: set = set_health


func _ready() -> void:
	health = MAX_HEALTH


func set_health(new_health: float):
	var clamped_new_health = clampf(new_health, 0, MAX_HEALTH)
	
	if health != clamped_new_health:
		health = clamped_new_health


#func freeze_frame(duration: float = 0.4, time_scale: float = 0.1) -> void:
	#Engine.time_scale = time_scale
	#await get_tree().create_timer(duration * time_scale).timeout
	#Engine.time_scale = 1


func _on_hurt_box_damage_recieved(damage: float) -> void:
	health = health - damage
