extends Node2D

@onready var enemy_group = $"EnemyGroup"
@onready var player_group = $PlayerGroup
var turn_order = []

func _ready():
	turn_order = player_group.players
	turn_order.append_array(enemy_group.enemies)
	for turn in turn_order:
		turn_order.sort_custom(SpeedSort)
		print(turn.new_mob)

func SpeedSort(a, b):
	if a.new_mob["Speed"] > b.new_mob["Speed"]:
		return true
	return false
