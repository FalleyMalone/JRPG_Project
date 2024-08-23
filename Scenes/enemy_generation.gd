extends Node2D

var spawn_points = ["One","Two","Three","Four","Five","Six"]
var last_spawn = ""
var random = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	random.randomize()
	for i in range(random.randi_range(1, 6)):
		var rand_spawn_point = spawn_points[randi() % spawn_points.size()]
		while rand_spawn_point == last_spawn:
			rand_spawn_point = spawn_points[randi() % spawn_points.size()]
		last_spawn = rand_spawn_point
		EnemyGenerate(rand_spawn_point)

func EnemyGenerate(spawn):
	var new_enemy = {}
	new_enemy["enemy_type"] = EnemyDetermineType()
	new_enemy["enemy_type_id"] = EnemyDetermineTypeID(new_enemy["enemy_type"])
	new_enemy["enemy_element"] = EnemyDetermineElement(new_enemy["enemy_type"], new_enemy["enemy_type_id"])
	new_enemy["enemy_sprite"] = EnemyDetermineSprite(new_enemy["enemy_type"], new_enemy["enemy_type_id"])
	new_enemy["enemy_spawn"] = "One"
	for i in GameData.enemy_stats:
		if GameData.enemy_data[new_enemy["enemy_type"]][new_enemy["enemy_type_id"]][i] != null:
			new_enemy[i] = EnemyDetermineStats(new_enemy["enemy_type"], new_enemy["enemy_type_id"], i)
	print(new_enemy)

func EnemyDetermineType():
	#Link up a ClassTable to make this game ready
	#Needs class rarity implemented
	var new_enemy_type
	var enemy_types = GameData.enemy_data.keys()
	randomize()
	new_enemy_type = enemy_types[randi() % enemy_types.size()]
	return new_enemy_type

func EnemyDetermineTypeID(enemy_type):
	var new_type_id 
	var type_ids = GameData.enemy_data[enemy_type].keys()
	randomize()
	new_type_id = type_ids[randi() % type_ids.size()]
	return new_type_id

func EnemyDetermineElement(enemy_type, enemy_type_id):
	var element = GameData.enemy_data[enemy_type][enemy_type_id]["Element"]
	return element

func EnemyDetermineSprite(enemy_type, enemy_type_id):
	var sprite = GameData.enemy_data[enemy_type][enemy_type_id]["Sprite"]
	return sprite

func EnemyDetermineSpawn(enemy_type, enemy_type_id, spawn):
	var spawn_point = GameData.enemy_possitions[spawn]
	return spawn_point

func EnemyDetermineStats(enemy_type, enemy_type_id, stat):
	var stat_val
	stat_val = GameData.enemy_data[enemy_type][enemy_type_id][stat]
	return snapped(stat_val, 1)
