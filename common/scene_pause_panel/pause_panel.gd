extends CanvasLayer

# useful links:
# https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html
# https://www.youtube.com/watch?v=-4jVIKix-yk

var just_paused = true


func _ready() -> void:
	continue_game()


func _process(delta: float) -> void:
	show()

	# HACK: Skip the first frame after pausing because the pause action is still active
	if just_paused:
		just_paused = false
		return

	if Input.is_action_just_pressed("pause"):
		continue_game()


func continue_game() -> void:
	get_tree().paused = false
	hide()
	just_paused = true
