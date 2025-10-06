extends State


@onready var animation_player := $"../../AnimationPlayer"
@onready var character_body := $"../../"


@export var speed: float = 1000


func Enter() -> void:
	animation_player.play("run")


func PhysicsUpdate(_delta) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if !direction: 
		ChangeStateTo("idle")
	
	if direction.x > 0:
		character_body.transform.x = Vector2(1.0, 0.0)
	elif direction.x < 0:
		character_body.transform.x = Vector2(-1.0, 0.0)
	
	character_body.velocity = direction * speed
	character_body.move_and_slide()
