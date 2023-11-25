extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.is_action_pressed("place_tower"):
		var mouse_pos = get_local_mouse_position()
		var tile_coords = local_to_map(mouse_pos)
		
		var data = get_cell_tile_data(0, tile_coords);
		print("Local cell: ");
		print(tile_coords);
		
		if data:
			print(data.get_custom_data("tower_type"))
		else:
			print("No tower type")
