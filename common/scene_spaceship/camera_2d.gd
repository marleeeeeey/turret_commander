extends Camera2D

@export var zoom_speed = 1.1


func _process(delta: float) -> void:
	if Input.is_action_pressed("zoom_in"):
		zoom *= zoom_speed

	if Input.is_action_pressed("zoom_out"):
		zoom /= zoom_speed
