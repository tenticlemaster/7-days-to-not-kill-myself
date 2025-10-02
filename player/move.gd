extends State

@export var player: CharacterBody2D
@export var speed: float = 1000

@export var animation_player: AnimationPlayer


func Enter() -> void:
	animation_player.play("run")


func PhysicsUpdate(_delta) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if !direction: 
		ChangeStateTo("Idle")
	
	player.velocity = direction * speed
	player.move_and_slide()
