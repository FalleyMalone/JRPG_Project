extends Node2D

@onready var enemy_group = $"EnemyGroup"
@onready var player_group = $PlayerGroup
@onready var choice_vis = $CanvasLayer/Choice
@onready var ready_vis = $CanvasLayer/TeamSetup
var turn_order = []
var enemies
var players

func _ready():
	enemies = enemy_group.enemies.size()
	players = player_group.players.size()
	turn_order = player_group.players
	turn_order.append_array(enemy_group.enemies)
	for turn in turn_order:
		turn_order.sort_custom(SpeedSort)
		print(turn.new_mob)

func SpeedSort(a, b):
	if a.new_mob["Speed"] > b.new_mob["Speed"]:
		return true
	return false

func _on_ready_pressed():
	global.pre_combat = false
	choice_vis.visible = true
	ready_vis.visible = false
	combat()

func combat():
	global.player_turn = true
