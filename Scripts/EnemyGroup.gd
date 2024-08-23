extends Node2D

var zones = ["One","Two","Three","Four","Five","Six"]
var action_queue: Array = []
var is_battling: bool = false
var index: int = 0
var spawn_points = ["One","Two","Three","Four","Five","Six"]
var last_spawn = ""
var random = RandomNumberGenerator.new()

signal next_player
@onready var choice = $"../CanvasLayer/Choice"

func _ready():
	random.randomize()
	for i in range(random.randi_range(1, 6)):
		var rand_spawn_point = spawn_points[randi() % spawn_points.size()]
		while rand_spawn_point == last_spawn:
			rand_spawn_point = spawn_points[randi() % spawn_points.size()]
		last_spawn = rand_spawn_point
		EnemyGenerate(rand_spawn_point)

#func _process(delta):
	#if not choice.visible:
		#if Input.is_action_just_pressed("ui_up"):
			#if index > 0:
				#index -= 1
				#switch_focus(index, index+1)
		#if Input.is_action_just_pressed("ui_down"):
			#if index < enemies.size() - 1:
				#index += 1
				#switch_focus(index, index-1)
		#if Input.is_action_just_pressed("ui_accept"):
			#action_queue.push_back(index)
			#enemies[index].take_damage(1)
			#emit_signal("next_player")
	
	#if action_queue.size() == enemies.size() and not is_battling:
		#is_battling = true
		#_action(action_queue)

func _action(stack):
	for i in stack:
		enemies[i].take_damage(1)
		await get_tree().create_timer(1).timeout
	action_queue.clear()
	is_battling = false
	#show_choice()

func switch_focus(x,y):
	enemies[x].focus()
	enemies[y].unfocus()

#func show_choice():
	#choice.show()
	#choice.find_child("Attack").grab_focus()

func _reset_focus():
	index = 0
	for enemy in enemies:
		enemy.unfocus()

func _start_choosing():
	_reset_focus()
	enemies[0].focus()

func _on_attack_pressed():
	choice.hide()
	_start_choosing()
