extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var health_bar = $TextureProgressBar
@onready var health_count = $TextureProgressBar/RichTextLabel
var selectable = false
var new_mob = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	new_mob["enemy_type"] = EnemyDetermineType()
	new_mob["enemy_type_id"] = EnemyDetermineTypeID(new_mob["enemy_type"])
	new_mob["Team"] = "Enemy"
	new_mob["enemy_element"] = EnemyDetermineElement(new_mob["enemy_type"], new_mob["enemy_type_id"])
	new_mob["enemy_sprite"] = EnemyDetermineSprite(new_mob["enemy_type"], new_mob["enemy_type_id"])
	for i in GameData.enemy_stats:
		if GameData.enemy_data[new_mob["enemy_type"]][new_mob["enemy_type_id"]][i] != null:
			new_mob[i] = EnemyDetermineStats(new_mob["enemy_type"], new_mob["enemy_type_id"], i)

func EnemyDetermineType():
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
	sprite_2d.texture = load(sprite)
	return sprite

func EnemyDetermineSpawn(spawn):
	var spawn_point = GameData.enemy_possitions[spawn]
	global_position = spawn_point
	new_mob["Location"] = spawn
	return spawn_point

func EnemyDetermineStats(enemy_type, enemy_type_id, stat):
	var stat_val
	stat_val = snapped(GameData.enemy_data[enemy_type][enemy_type_id][stat], 1)
	if stat == "Health":
		health_bar.max_value = stat_val
		health_bar.value = stat_val
		health_count.append_text("[center][b]%s/%s" % [stat_val, stat_val])
	return stat_val

func _process(delta):
	if selectable:
		if Input.is_action_pressed("click"):
			pass

func _on_area_2d_mouse_entered():
	if not global.pre_combat && global.player_turn:
		global.selected_zones[new_mob["Location"]] = true
		selectable = true
		scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not global.pre_combat && global.player_turn:
		global.selected_zones[new_mob["Location"]] = false
		selectable = false
		scale = Vector2(1, 1)
