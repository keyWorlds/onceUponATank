extends Node2D

func _ready():
	set_camera_limits()

func set_camera_limits():
	var map_limits = $Ground.get_used_rect()
	var map_cellsize = $Ground.cell_size
	
	$Tank/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Tank/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Tank/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Tank/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func _on_Tank_fire(bullet, position, direction):
	var b = bullet.instance()
	add_child(b)
	b.createBullet(position, direction)
