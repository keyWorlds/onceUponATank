extends "res://scripts/Tank.gd"

onready var parent = get_parent()

func control(delta):
	# point to player
	#$Turret.look_at(get_node("/root/Tank").position)
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
	else:
		pass