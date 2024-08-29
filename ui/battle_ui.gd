extends CanvasLayer

@onready var sprite_2d = $Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/PlayerPort
@onready var health_val = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/HealthLable/HealthVal"
@onready var health_bar = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/Health"
@onready var stam_val = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/StamLable/StamVal"
@onready var stam_bar = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/Stam"
@onready var mana_val = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/ManaLable/ManaVal"
@onready var mana_bar = $"Control/MarginContainer/VBoxContainer/MainBar/PlayerStats/Val Bars/Mana"

signal selected_attack

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
		var attack_num = global.temp["Attacks"].size()
		for i in range(attack_num):
			var button_node = get_node(action_bars[i] + "/ActionButton")
			var icon = get_node(action_bars[i] + "/ActionTab/AbilityIcon")
			var a_name = get_node(action_bars[i] + "/ActionTab/AbilityName")
			var a_cost = get_node(action_bars[i] + "/ActionTab/AbilityCost")
			button_node.visible = true
			icon.texture = load("res://Sprites/Placeholder/" + global.temp["Attacks"][i]["Type"] + ".png")
			a_name.text = global.temp["Attacks"][i]["Name"]
			a_cost.text = str(global.temp["Attacks"][i]["Cost"])



func _on_action_button1_pressed():
	selected_attack.emit(global.temp["Attacks"][1])


func _on_action_button2_pressed():
	selected_attack.emit(global.temp["Attacks"][2])


func _on_action_button3_pressed():
	selected_attack.emit(global.temp["Attacks"][3])


func _on_action_button4_pressed():
	selected_attack.emit(global.temp["Attacks"][4])


func _on_action_button5_pressed():
	selected_attack.emit(global.temp["Attacks"][5])


func _on_action_button6_pressed():
	selected_attack.emit(global.temp["Attacks"][6])


func _on_action_button7_pressed():
	selected_attack.emit(global.temp["Attacks"][7])


func _on_action_button8_pressed():
	selected_attack.emit(global.temp["Attacks"][8])


func _on_action_button9_pressed():
	selected_attack.emit(global.temp["Attacks"][9])


func _on_action_button10_pressed():
	selected_attack.emit(global.temp["Attacks"][10])


func _on_action_button11_pressed():
	selected_attack.emit(global.temp["Attacks"][11])


func _on_action_button12_pressed():
	selected_attack.emit(global.temp["Attacks"][12])
