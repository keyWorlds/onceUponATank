extends "res://scripts/Tank.gd"

onready var parent = get_parent()

export (float) var turret_speed
export (float) var detection_radius

var target = null

func control(delta):
	# point to player
	#$Turret.look_at(get_node("/root/Tank").position)
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		position = Vector2()
	else:
		pass

func _process(delta):
	if target:
		var target_dir = (target.global_position - global_position).normalized()
		var current_dir = Vector2(1, 0).rotated($Turret.global_rotation)
		$Turret.global_rotation = current_dir.linear_interpolate(target_dir, turret_speed * delta).angle()

func _on_DetectionArea_body_entered(body):
	if body.name == "Tank":
		target = body

func _on_DetectionArea_body_exited(body):
	if body == target:
		target = null
