extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_game_controller_money_changed(amount):
	$VBoxContainer/HBoxContainer/Cash.text = str(amount)

func _on_game_controller_wave_changed(wave):
	$VBoxContainer/HBoxContainer2/Wave.text = str(wave)

func _on_game_controller_health_changed(health):
	$VBoxContainer/HBoxContainer/Life.text = str(health)
