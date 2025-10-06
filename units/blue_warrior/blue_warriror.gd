extends CharacterBody2D


func _on_health_death() -> void:
	queue_free()
