extends "res://towers/BaseTower.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ShootingTimer.wait_time = fire_rate;
	$ShootingTimer.start();
	$Area2D/CollisionShape2D.shape.radius = radius;
	
func _on_shooting_timer_timeout():
	$Fire.visible = true;
	$Fire/EffectReset.start()
