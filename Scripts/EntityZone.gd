extends StaticBody2D

@onready var texture = $TextureRect


func _process(delta):
	if get_name() == global.active_entity:
		texture.texture = load("res://Sprites/Placeholder/CharacterFocus.png")
	elif global.selected_zones[str(get_name())]:
		texture.texture = load("res://Sprites/Placeholder/AttackFocus.png")
	else:
		texture.texture = load("res://Sprites/Placeholder/CharacterPos.png")

