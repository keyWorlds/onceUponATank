extends KinematicBody2D

signal fire
signal heath_changed
signal dead

export (PackedScene) var Bullet
export (int) var speed
export (float) var rotation_speed
export (float) var gun_cooldown
export (int) var health

var velocity = Vector2()
var can_openFire = true
var alive = true

func _ready():
	$Timer.wait_time = gun_cooldown

func control(delta):
	pass

func fire():
	if can_openFire:
		can_openFire = false
		$Timer.start()
		
		var dir = Vector2(1, 0).rotated($Turret.global_rotation)
		emit_signal('fire', Bullet, $Turret/Muzzle.global_position, dir)

func _physics_process(delta):
	if not alive:
		return
	control(delta)
	move_and_slide(velocity)