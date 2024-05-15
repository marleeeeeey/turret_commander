extends CharacterBody2D

@export var speed = 300.0


func _ready() -> void:
	$NavigationAgent2D.target_position = Vector2.ZERO


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
