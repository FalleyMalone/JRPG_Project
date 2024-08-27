extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var health_bar = $TextureProgressBar
@onready var health_count = $TextureProgressBar/RichTextLabel
var new_mob = {}
var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos 
var zone_names = ["OneP","TwoP","ThreeP","FourP","FiveP","SixP"]


func _ready():
	new_mob["character_id"] = CharacterDetermineClass()
	new_mob["Team"] = "Player"
	new_mob["level"] = 1
	new_mob["Defense"] = 0
	new_mob["character_rarity"] = CharacterDetermineRarity()
	CharacterDetermineBackground()
	CharacterDetermineRaceGender()
	for i in GameData.character_stats:
		if GameData.character_data[new_mob["character_id"]][i] != null:
			new_mob[i] = CharacterDetermineStats(new_mob["character_id"], new_mob["character_rarity"], i)

func CharacterDetermineClass():
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

func CharacterDetermineSpawn(spawn):
	var spawn_point = GameData.player_possitions[spawn]
	global_position = spawn_point
	new_mob["Location"] = spawn
	initialPos = spawn
	global.player_zones[spawn] = false

func CharacterDetermineStats(character_id, rarity, stat):
	var stat_val = GameData.character_data[character_id][stat] * GameData.character_data[character_id][rarity + "Multi"]
	if stat == "Con":
		new_mob["Health"] = 5 + stat_val
		health_bar.max_value = new_mob["Health"]
		health_bar.value = new_mob["Health"]
		health_count.append_text("[center][b]%s/%s" % [stat_val, stat_val])
	elif stat == "Dex":
		new_mob["Speed"] = stat_val
	return snapped(stat_val, 1)

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable && global.player_zones[body_ref]:
				#Move Player
				tween.tween_property(self, "position", GameData.player_possitions[body_ref], 0.2).set_ease(Tween.EASE_OUT)
				#Update zone filled/empty
				global.player_zones[body_ref] = false
				global.player_zones[initialPos] = true
				#Update return position
				initialPos = body_ref
				new_mob["Location"] = initialPos
			else:
				#Return Player
				tween.tween_property(self, "global_position", GameData.player_possitions[initialPos], 0.2).set_ease(Tween.EASE_OUT)

func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body_ref = body.get_name()

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false

func _on_area_2d_mouse_entered():
	if not global.is_dragging && global.pre_combat:
		draggable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1, 1)
