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
		
		var tile_id = get_cell_source_id(0, tile_coords);

