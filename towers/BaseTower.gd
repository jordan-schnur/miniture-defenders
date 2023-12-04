extends Node2D

@export_category("Towers")
@export var enemies_node: Node2D;
@export var radius: int;
@export var fire_rate: int;

signal fire(position, speed)


# Called when the node enters the scene tree for the first time.
func _ready():
	$ShootingTimer.wait_time = fire_rate;
	$ShootingTimer.start();
	$Area2D/CollisionShape2D.shape.radius = radius;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var closest: Node2D = null;
	var closest_dis = radius;
	for enemy in enemies_node.get_children():
		var distance = self.global_position.distance_to(enemy.global_position);
		if distance < closest_dis:
			closest = enemy;
			closest_dis = distance;
				
	if closest != null:
		look_at(closest.global_position)
		rotation = rotation + PI / 2
