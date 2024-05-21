extends Node2D

@export var game_logic_scene: PackedScene
@export var pause_menu_scene: PackedScene

# Create game_logic when game begin. Destroy at the end.
var game_logic = null
var pause_menu = null

func _ready() -> void:
	game_logic = game_logic_scene.instantiate()
	add_child(game_logic)
	pause_menu = pause_menu_scene.instantiate()
	add_child(pause_menu)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		# Pause menu disabled by default. Enalble pause menu processing here
		# while other part of the game has stopped.
		pause_menu.process_mode = Node.PROCESS_MODE_ALWAYS
