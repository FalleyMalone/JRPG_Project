extends StaticBody2D

@onready var texture = $TextureRect
@export var zone: StaticBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global.selected_zones[get_name()]:
		texture.texture = load("res://Sprites/Placeholder/AttackFocus.png")
	else:
		texture.texture = load("res://Sprites/Placeholder/CharacterPos.png")

