class_name HurtBox
extends Area2D


signal damage_recieved


@export var health: Health


func _ready() -> void:
	connect("area_entered", _on_area_entered)


func _on_area_entered(hitbox: HitBox) -> void:
	if hitbox != null:
		health.health -= hitbox.damage
		damage_recieved.emit(hitbox.damage)
