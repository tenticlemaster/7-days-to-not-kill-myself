class_name Player
extends CharacterBody2D


@export var speed: float
@export var acceleration: float
@export var friction: float


func freeze_frame(duration: float = 0.4, time_scale: float = 0.1) -> void:
	Engine.time_scale = time_scale
	await get_tree().create_timer(duration * time_scale).timeout
	Engine.time_scale = 1


func _on_health_health_update() -> void:
	freeze_frame()
