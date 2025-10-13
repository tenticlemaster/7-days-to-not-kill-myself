extends AIBody


func _on_health_death() -> void:
	queue_free()
