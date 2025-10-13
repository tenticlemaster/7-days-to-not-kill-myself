extends AIState


@export var hitbox: HitBox


func Enter() -> void:
	animation_tree.active = true
	hitbox.monitorable = true


func Update(_delta) -> void:
	if !attack_area.overlaps_body(character_body.player):
		ChangeStateTo('idle')
	
	animation_tree.set(
			"parameters/blend_position", 
			character_body.to_local(
				character_body.player.global_position
			).normalized()
		)


func Exit() -> void:
	animation_tree.active = false
	hitbox.monitorable = false
