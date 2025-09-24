extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	# Flip sprite horizontally based on which direction character moves
	if (get_parent().velocity.x > 0):
		flip_h = 0
	if (get_parent().velocity.x < 0):
		flip_h = 1
