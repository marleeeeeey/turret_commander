extends CharacterBody2D

@export var speed = 600
@export var show_debug_info = false
@export var control_via_mouse_enabled = false
@export var control_via_keys_enabled = true
@export var bullet_scene: PackedScene
@export var turret_scene: PackedScene
@export var distance_to_spawn_turret_behind_player = 60
@export var debug_aim_scene: PackedScene

var last_global_direction = Vector2.AXIS_X


func _input(event):
	if control_via_mouse_enabled:
		_control_via_mouse_event(event)


func _process(delta: float) -> void:
	if control_via_keys_enabled:
		_control_via_keyboard_and_gamepad_event()

	# Move the character.
	move_and_slide()


func _physics_process(delta: float) -> void:
	if $NavigationAgent2D.is_navigation_finished():
		return

	# Calculate the next path position.
	var next_path_position = $NavigationAgent2D.get_next_path_position()

	# Rotate towards the next path position. X axis is the forward direction.
	look_at(next_path_position)

	# Calc velocity towards the next path position.
	var diff = next_path_position - global_position
	var direction = diff.normalized()
	velocity = direction * speed

	# Move the character.
	move_and_slide()


func _control_via_mouse_event(event):
	# Mouse in viewport (screen) coordinates.
	var event_mouse_button = event as InputEventMouseButton
	if not event_mouse_button:
		return

	if event_mouse_button.button_index != MOUSE_BUTTON_LEFT:
		return

	if not event_mouse_button.pressed:
		return

	# World2D - holds all components of a 2D world, such as a canvas and a physics space.
	var map = get_world_2d().navigation_map

	# Get camera zoom.
	var zoom = $Camera2D.get_zoom()

	# From official doc:
	# https://docs.godotengine.org/en/stable/tutorials/2d/2d_transforms.html#transform-functions
	# var screen_coord = get_viewport().get_screen_transform() * get_global_transform_with_canvas() * local_pos

	# Read more here
	# https://docs.godotengine.org/en/stable/tutorials/inputs/mouse_and_input_coordinates.html
	var screen_center = $Camera2D.get_screen_center_position()
	var viewport_size = get_viewport().get_visible_rect().size / zoom
	var screen_top_left = screen_center - viewport_size / 2
	var mouse_pos = event_mouse_button.position / zoom + screen_top_left

	# Set the point to navigate to.
	var closest_point_on_nav_map = NavigationServer2D.map_get_closest_point(map, mouse_pos)
	$NavigationAgent2D.target_position = closest_point_on_nav_map

	# Debug draw the point.
	if show_debug_info:
		# Debug draw the point.
		var aim = debug_aim_scene.instantiate()
		aim.position = closest_point_on_nav_map
		aim.debug_text = "world"
		get_viewport().add_child(aim)


func _control_via_keyboard_and_gamepad_event():
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed
	# Rotate the character.
	if direction.length() > 0:
		last_global_direction = direction
		look_at(global_position + direction)

	if Input.is_action_just_pressed("shoot"):
		_shoot()

	if Input.is_action_just_pressed("spawn_turret"):
		var turret = turret_scene.instantiate()
		owner.add_child(turret)
		turret.owner = owner
		var position_behind = (
			global_position - last_global_direction * distance_to_spawn_turret_behind_player
		)
		turret.global_position = position_behind
		turret.look_at(global_position + last_global_direction)


func _shoot():
	var bullet = bullet_scene.instantiate()
	owner.add_child(bullet)
	bullet.transform = $BulletSpawnPoint.global_transform
