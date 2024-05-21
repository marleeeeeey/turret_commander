extends CanvasLayer


func _ready() -> void:
	# clear the labels
	set_top_left_label("")
	set_top_right_label("")


func set_top_left_label(text: String) -> void:
	$TopLeftLabel.text = text


func set_top_right_label(text: String) -> void:
	$TopRightLabel.text = text
