extends Node2D

# Called when the node enters the scene tree for the first time.
func _input(event):
	if event.is_action_pressed("ui_accept"):
		CharacterGenerate()

func CharacterGenerate():
	var new_character = {}
	new_character["character_id"] = CharacterDetermineClass()
	new_character["character_rarity"] = CharacterDetermineRarity()
	CharacterDetermineBackground()
	CharacterDetermineRaceGender()
	for i in GameData.character_stats:
		if GameData.character_data[new_character["character_id"]][i] != null:
			new_character[i] = CharacterDetermineStats(new_character["character_id"], new_character["character_rarity"], i)
	print(new_character)

func CharacterDetermineClass():
	#Link up a ClassTable to make this game ready
	#Needs class rarity implemented
	var new_character_class
	var character_classes = GameData.character_data.keys()
	randomize()
	new_character_class = character_classes[randi() % character_classes.size()]
	return new_character_class

func CharacterDetermineRarity():
	var new_character_rarity
	var character_rarities = GameData.character_rarity_distribution.keys()
	randomize()
	var rarity_roll = randi() % 100 + 1
	for i in character_rarities:
		if rarity_roll <= GameData.character_rarity_distribution[i]:
			new_character_rarity = i
			break
		else:
			rarity_roll -= GameData.character_rarity_distribution[i]
	return new_character_rarity

func CharacterDetermineBackground():
	pass

func CharacterDetermineRaceGender():
	pass

func CharacterDetermineStats(character_id, rarity, stat):
	var stat_val
	stat_val = GameData.character_data[character_id][stat] * GameData.character_data[character_id][rarity + "Multi"]
	return snapped(stat_val, 1)
