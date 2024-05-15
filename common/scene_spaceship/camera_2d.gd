extends Camera2D

@export var zoom_speed = 1.1

func _input(event: InputEvent) -> void:
	var event_mouse_button = event as InputEventMouseButton
	if not event_mouse_button:
		return

	if event_mouse_button.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		zoom /= zoom_speed

	if event_mouse_button.button_index == MOUSE_BUTTON_WHEEL_UP:
		zoom *= zoom_speed
