extends CanvasLayer

# useful links:
# https://docs.godotengine.org/en/stable/tutorials/scripting/pausing_games.html
# https://www.youtube.com/watch?v=-4jVIKix-yk

var just_paused = true


func _ready() -> void:
	hide()
	process_mode = Node.PROCESS_MODE_DISABLED


func _process(delta: float) -> void:
	# HACK: Skip the first frame after pausing because the pause action is still active
	if just_paused:
		$AnimationPlayer.play("start_pause")
		just_paused = false
		return

	if Input.is_action_just_pressed("pause"):
		_stop_pause()


func show_text(text) -> void:
	$Label.text = text
	process_mode = Node.PROCESS_MODE_ALWAYS
	show()
	get_tree().paused = true


func _stop_pause() -> void:
	get_tree().paused = false
	hide()
	just_paused = true
	process_mode = Node.PROCESS_MODE_DISABLED
