extends Node2D

@onready var enemy_group = $"EnemyGroup"
@onready var player_group = $PlayerGroup
@onready var choice_vis = $BattleUi
@onready var ready_vis = $CanvasLayer/TeamSetup

signal update_ui
var turn_order = []
var enemies
var players
var i = 0


func _ready():
	enemies = enemy_group.enemies.size()
	players = player_group.players.size()
	turn_order = player_group.players
	turn_order.append_array(enemy_group.enemies)
	for turn in turn_order:
		turn_order.sort_custom(SpeedSort)
	for turn in turn_order:
		print(turn.new_mob)

func SpeedSort(a, b):
	if a.new_mob["Speed"] > b.new_mob["Speed"]:
		return true
	return false

func _on_ready_pressed():
	global.pre_combat = false
	choice_vis.visible = true
	ready_vis.visible = false
	
	global.active_entity = turn_order[0].new_mob["Location"]
	global.temp = turn_order[0].new_mob
	print(global.temp)
	update_ui.emit()
	combat()

func combat():
	global.player_turn = true
	play_turn(i)
	#await(play_turn)
	#i  = (i + 1) % turn_order.size()
	global.active_entity = turn_order[i].new_mob["Location"]
	global.temp = turn_order[0].new_mob
	update_ui.emit()

func play_turn(i):
	match(turn_order[i].new_mob["Team"]):
		"Player":
			global.player_turn = true
		"Enemy":
			global.player_turn = false

