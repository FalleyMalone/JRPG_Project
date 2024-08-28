extends Node2D

var zones = ["OneE","TwoE","ThreeE","FourE","FiveE","SixE"]
var used_spawns = []
var random = RandomNumberGenerator.new()
var enemy_gen = preload("res://Scenes/enemy_generation.tscn")
var enemies = []

func _ready():
	var starting_nodes = get_child_count()
	random.randomize()
	remove_draggable()
	for i in range(random.randi_range(1, 6)):
		var rand_spawn_point = zones[randi() % zones.size()]
		while used_spawns.has(rand_spawn_point):
			rand_spawn_point = zones[randi() % zones.size()]
		used_spawns.append(rand_spawn_point) 
		var instance = enemy_gen.instantiate()
		instance.EnemyDetermineSpawn(rand_spawn_point)
		add_child(instance)
		enemies.append(instance)
	var current_nodes = get_child_count()


	
func remove_draggable():
	for child in get_children():
		child.remove_from_group("dropable")
