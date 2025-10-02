extends Node
class_name Health

@export var MAX_HEALTH: float
var health: float: set = set_health

signal health_update


func _ready() -> void:
	health = MAX_HEALTH


func set_health(new_health: float):
	var clamped_new_health = clampf(new_health, 0, MAX_HEALTH)
	
	if health != clamped_new_health:
		health = clamped_new_health
		health_update.emit(health)
