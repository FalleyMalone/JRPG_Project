extends Node

var data_file_path = "res://combat_data/ClassData.json"
var enemy_file_path = "res://combat_data/EnemyData.json"
var ability_file_path = "res://combat_data/AbilityData.json"
var character_data = {}
var enemy_data = {}
var ability_data = {}

var character_rarity_distribution = {
		"Common": 50,
		"Uncommon": 25,
		"Rare": 14,
		"Epic": 7,
		"Legendary": 4}

var enemy_possitions = {
	"OneE":   Vector2(1020, 273),
	"TwoE":   Vector2(1031, 386),
	"ThreeE": Vector2(1042, 499),
	"FourE":  Vector2(831, 273),
	"FiveE":  Vector2(842, 386),
	"SixE":   Vector2(853, 499),
}

var player_possitions = {
	"OneP":   Vector2(129, 273),
	"TwoP":   Vector2(118, 386),
	"ThreeP": Vector2(107, 499),
	"FourP":  Vector2(318, 273),
	"FiveP":  Vector2(307, 386),
	"SixP":   Vector2(296, 499),
}

var character_stats = ["Str", "Dex", "Con", "Wis", "Int", "Cha", "Luck"]
var enemy_stats = ["Health", "Defense", "Speed", "Attack"]

func _ready():
	character_data = load_json_data(data_file_path)
	enemy_data = load_json_data(enemy_file_path)
	ability_data = load_json_data(ability_file_path)


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
