extends Node2D

var is_dragging = false

var pre_combat = true

var player_turn = false

var current_turn 

var selected_zones = {
	"OneP"   : false,
	"TwoP"   : false,
	"ThreeP" : false,
	"FourP"  : false,
	"FiveP"  : false,
	"SixP"   : false,
	"OneE"   : false,
	"TwoE"   : false,
	"ThreeE" : false,
	"FourE"  : false,
	"FiveE"  : false,
	"SixE"   : false
}

var player_zones = {
	"OneP"   : true,
	"TwoP"   : true,
	"ThreeP" : true,
	"FourP"  : true,
	"FiveP"  : true,
	"SixP"   : true
}

var enemy_zones = {
	"OneE"   : true,
	"TwoE"   : true,
	"ThreeE" : true,
	"FourE"  : true,
	"FiveE"  : true,
	"SixE"   : true
}
