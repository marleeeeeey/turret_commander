extends Sprite2D

var debug_text = ""
var show_text = false


func _ready() -> void:
	$Timer.start()


func _process(delta: float) -> void:
	if show_text:
		$DebugLabel.show()
		$PosLabel.show()
	else:
		$DebugLabel.hide()
		$PosLabel.hide()

	$PosLabel.text = "l: %s g: %s" % [position, global_position]
	$DebugLabel.text = debug_text


func _on_timer_timeout() -> void:
	queue_free()
