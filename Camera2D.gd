extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	var camera_move = Vector2(0, 0)
	
	if event.is_action_pressed("camera_up"):
		camera_move = Vector2(0, 50);
	elif event.is_action_pressed("camera_down"):
		camera_move = Vector2(0, -50);
	
	offset += camera_move;
	
