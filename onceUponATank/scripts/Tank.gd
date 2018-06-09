extends KinematicBody2D

signal heath_chnged
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var health

var velocity = Vector2()
var can_shoot = true
var alive = true

func _ready():
	$Timer.wait_time = gun_cooldown

func control(delta):
	pass

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)