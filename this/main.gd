extends Node2D

@export var game_logic_scene: PackedScene

var game_logic = null

func _ready() -> void:
	game_logic = game_logic_scene.instantiate()
	add_child(game_logic)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		$PauseMenu.process_mode = Node.PROCESS_MODE_ALWAYS
