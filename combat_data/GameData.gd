extends Node

var data_file_path = "res://combat_data/ClassData.json"
var enemy_file_path = "res://combat_data/EnemyData.json"
var character_data = {}
var enemy_data = {}
var character_rarity_distribution = {
		"Common": 50,
		"Uncommon": 25,
		"Rare": 14,
		"Epic": 7,
		"Legendary": 4}
var character_stats = ["Str", "Dex", "Con", "Wis", "Int", "Cha", "Luck"]

func _ready():
	character_data = load_json_data(data_file_path)
	enemy_data = load_json_data(enemy_file_path)


func load_json_data(filePath : String):
	if FileAccess.file_exists(filePath):
		var dataFile = FileAccess.open(filePath, FileAccess.READ)
		var parsedResult = JSON.parse_string(dataFile.get_as_text())
		
		if parsedResult is Dictionary:
			return parsedResult
		else:
			print("Error Loading json")
	else:
		print("Could not find json")
