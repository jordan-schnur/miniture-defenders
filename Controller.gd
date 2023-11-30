extends Node

signal money_changed(new_money)
signal wave_changed(new_wave)
signal health_changed(new_health)
signal place_tower(tower_type, position)

@export_category("Game Options")
@export var starting_money: int = 200
@export var starting_health: int = 20

var money = starting_money;
var health = starting_health;

# Called when the node enters the scene tree for the first time.
func _ready():
	money_changed.emit(starting_money)
	health_changed.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_start_game():
	$Timer.start()


func _on_map_request_tower_placement(tower_type, position):
	var cost = 100
	if money - cost >= 0:
		print("Placing Tower")
		money = money - cost;
		money_changed.emit(money)
		place_tower.emit("aoe", position);
		


func _on_map_enemy_exited():
	health = health - 1
	health_changed.emit()
