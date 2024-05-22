extends Node2D

@export var game_logic_scene: PackedScene
@export var pause_message_scene: PackedScene

# Create game_logic when game begin. Destroy at the end.
var game_logic: GameLogic = null
var pause_message = null
var should_create_game_logic = true


func _ready() -> void:
	# Init PauseMenu
	pause_message = pause_message_scene.instantiate()
	add_child(pause_message)


func _process(delta: float) -> void:
	if should_create_game_logic:
		if game_logic:
			game_logic.queue_free()
		_create_game_logic()
		should_create_game_logic = false
		pause_message.show_text("TURRET COMMANDER", "", "press space key to start")

	if Input.is_action_just_pressed("pause"):
		pause_message.show_text("PAUSE")


func _on_game_over() -> void:
	pause_message.show_text(
		"GAME OVER", "TURRET COMMANDER", "Your score: %d" % game_logic.get_scores()
	)
	should_create_game_logic = true


func _create_game_logic() -> void:
	game_logic = game_logic_scene.instantiate()
	add_child(game_logic)
	game_logic.on_game_over.connect(_on_game_over)
