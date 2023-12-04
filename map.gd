extends Node2D

signal request_tower_placement(tower_type, position)
signal enemy_exited()

@export_category("Map Options")
@export var towers_tile_map: TileMap
@export var enemy_path: Path2D

# Called when the node enters the scene tree for the first time.
func _ready():
	for enemy in get_node("Enemies").get_children():
		enemy.progress = 0
		enemy.offset = Vector2(randi_range(-20, 20), randi_range(-20, 20))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for enemy in get_node("Enemies").get_children():
		var speed = enemy.speed * delta;
		var progress = enemy.progress
		enemy.progress = progress + speed
		move_enemy_along_path(enemy, progress + speed);
	
func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("place_tower"):
		var mouse_pos = towers_tile_map.get_local_mouse_position()
		var tile_coords = towers_tile_map.local_to_map(mouse_pos)
		
		var data = towers_tile_map.get_cell_tile_data(0, tile_coords);
		
		if data:
			request_tower_placement.emit(data.get_custom_data("tower_type"), tile_coords)

func move_enemy_along_path(enemy, progress):
	var path = $Path2D/PathFollow2D
	path.progress = progress;
	var direction = path.rotation
	enemy.position = path.position + enemy.offset;
	enemy.rotation = direction;


func _on_exit_area_entered(area):
	enemy_exited.emit()


func _on_game_controller_place_tower(tower_type, position):
	print("Hello, WOrld!")
	var big_gun_scene = load("res://towers/BigGun.tscn")
	
	var big_gun_instance = big_gun_scene.instantiate()
	
	var localPos = towers_tile_map.map_to_local(position) / 4;
	
	big_gun_instance.position = localPos
	big_gun_instance.enemies_node = $Enemies;
	
	$Towers.add_child(big_gun_instance)
	
	towers_tile_map.erase_cell(1, position)
