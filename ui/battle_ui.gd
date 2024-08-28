extends CanvasLayer

@onready var sprite_2d = $Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/PlayerPort
@onready var health_val = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/HealthLable/HealthVal"
@onready var health_bar = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/Health"
@onready var stam_val = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/StamLable/StamVal"
@onready var stam_bar = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/Stam"
@onready var mana_val = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/ManaLable/ManaVal"
@onready var mana_bar = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/Mana"


var action_bars = ["Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol/ActionRow", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol/ActionRow2", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol/ActionRow3", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol/ActionRow4", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol2/ActionRow", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol2/ActionRow2", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol2/ActionRow3", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol2/ActionRow4", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol3/ActionRow", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol3/ActionRow2", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol3/ActionRow3", 
"Control/MarginContainer/VBoxContainer/MainBar/ActionOptions/ActionCol3/ActionRow4"]


func _process(delta):
	pass


func _on_test_level_update_ui():
	if global.temp["Team"] == "Player":
		sprite_2d.texture = load(global.temp["Sprite"])
		health_val.text = str(global.temp["Health"])
		health_bar.value = global.temp["Health"]
		health_bar.max_value = global.temp["Health"]
		stam_val.text = str(global.temp["Stamana"])
		stam_bar.value = global.temp["Stamana"]
		stam_bar.max_value = global.temp["Stamana"]
		mana_val.text = str(global.temp["Mana"])
		mana_bar.value = global.temp["Mana"]
		mana_bar.max_value = global.temp["Mana"]
		for a in global.temp["Attacks"]:
			var attack_num = global.temp["Attacks"].size()
			var attack = global.temp["Attacks"][a]
			for i in range(attack_num):
				var button_node = get_node(action_bars[i] + "/ActionButton")
				var icon = get_node(action_bars[i] + "/ActionTab/AbilityIcon")
				var a_name = get_node(action_bars[i] + "/ActionTab/AbilityName")
				var a_cost = get_node(action_bars[i] + "/ActionTab/AbilityCost")
				button_node.visible = true
				icon.texture = load("res://Sprites/Placeholder/" + attack["Type"] + ".png")
				a_name.text = attack["Name"]
				a_cost.text = str(attack["Cost"])
	
