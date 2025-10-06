extends Node
class_name Health

@export var MAX_HEALTH: int
var health: int: set = set_health

signal health_update
signal death


func _ready() -> void:
	health = MAX_HEALTH


func set_health(new_health: int):
	var clamped_new_health = clampi(new_health, 0, MAX_HEALTH)
	
	if health != clamped_new_health:
		health = clamped_new_health
		health_update.emit(health)
	
	if health == 0:
		death.emit()
