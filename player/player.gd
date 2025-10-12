extends CharacterBody2D
class_name Player

@export var max_speed: float
@export var friction: float
var speed: float
var attack_velocity: Vector2


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	var move_velocity = direction * speed
	
	if attack_velocity:
		velocity = attack_velocity
	else:
		velocity = velocity.move_toward(move_velocity, friction * delta)
	
	move_and_slide()


func attack_lunge() -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	await get_tree().create_timer(.2).timeout
	attack_velocity = direction * max_speed * 10
	await get_tree().create_timer(.1).timeout
	attack_velocity = Vector2.ZERO
	velocity = Vector2.ZERO


func _on_state_machine_state_changed(new_state_name: String) -> void:
	match new_state_name:
		"idle":
			speed = 0
		"run":
			speed = max_speed
		"attack":
			speed = 0
			attack_lunge()
