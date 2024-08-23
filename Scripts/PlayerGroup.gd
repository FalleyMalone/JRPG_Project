extends Node2D

#var zones = ["OneP","TwoP","ThreeP","FourP","FiveP","SixP"]
var used_spawns = []
var zones = []
var random = RandomNumberGenerator.new()
var player_gen = preload("res://Scenes/character_generation.tscn")
var players = []

@onready var choice = $"../CanvasLayer/Choice"

func _ready():
	zones = get_children()
	SpawnPlayer()
	var current_nodes = get_child_count()

func SpawnPlayer():
	random.randomize()
	for i in range(random.randi_range(1, 6)):
		var rand_spawn_point = zones[randi() % zones.size()]
		var location_name = rand_spawn_point.get_name()
		while used_spawns.has(location_name):
			rand_spawn_point = zones[randi() % zones.size()]
			location_name = rand_spawn_point.get_name()
		used_spawns.append(location_name) 
		var instance = player_gen.instantiate()
		instance.CharacterDetermineSpawn(location_name)
		add_child(instance)
		players.append(instance)
