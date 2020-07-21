# Personal notation rules: myFunctions, godot_functions, _godot_methods (so i can diferentiate between them)
extends Node

# DOCS: onready - Defers initialization of a member variable until _ready() is called.
onready var navigation : Navigation2D = $Navigation2D
onready var line : Line2D = $Line2D
onready var player : Sprite = $Player

#DOCS: _unhandled_input() - Called when an InputEvent hasn't been consumed by _input() or any GUI. 
func _unhandled_input(event : InputEvent):
	if not event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or not event.pressed:
		return

	#DOCS: get_simple_path() - Returns the path between two given points. Points are in local coordinate space.
	var new_path : = navigation.get_simple_path(player.global_position, event.global_position)
	player.path = new_path
	line.points = new_path
