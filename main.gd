extends Node2D

signal start_game

var is_game_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if is_game_active:
		pass
	
	if event.is_action_pressed(start_game):
		#start_game.emit()
