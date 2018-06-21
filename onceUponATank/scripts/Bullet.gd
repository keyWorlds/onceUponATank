extends Area2D

export (float) var lifetime
export (int) var damage
export (int) var speed

var velocity = Vector2()

func createBullet(pos, direction):
	position = pos
	rotation = direction.angle()
	
	$Lifetime.wait_time = lifetime
	velocity = direction * speed

func _process(delta):
	position += velocity * delta

func timeoutThenExplode():
	queue_free()

func _on_Bullet_body_entered(body):
	timeoutThenExplode()
	if body.has_method('takeDamage'):
		body.take_damage()

func _on_Lifetime_timeout():
	timeoutThenExplode()
