extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("Ready here");
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print("Why am I being removed?")
	pass

func _input(event):
	print("Event");
	
