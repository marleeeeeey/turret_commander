class_name Enemy extends CharacterBody2D

@export var speed = 300.0

@onready var nav_agent : NavigationAgent2D = $NavigationAgent2D
@onready var timer_nav_to_fort : Timer = $TimerNavToFort


func _ready() -> void:
	timer_nav_to_fort.start()


func _physics_process(delta: float) -> void:
	if nav_agent.is_navigation_finished():
		return

	# Calculate the next path position.
	var next_path_position = nav_agent.get_next_path_position()

	# Rotate towards the next path position. X axis is the forward direction.
	look_at(next_path_position)

	# Calc velocity towards the next path position.
	var diff = next_path_position - global_position
	var direction = diff.normalized()
	velocity = direction * speed

	# Move the character.
	move_and_slide()


func _on_turrets_scan_area_body_entered(body: Node2D) -> void:
	var turret = body as Turret
	if turret:
		nav_agent.target_position = turret.global_position
		timer_nav_to_fort.start()


func _on_timer_nav_to_fort_timeout() -> void:
	nav_agent.target_position = Vector2.ZERO
