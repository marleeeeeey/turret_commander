extends Area2D

var speed = 2500
var life_time_sec = 10


func _ready() -> void:
	$DeadTimer.start(life_time_sec)
	

func _physics_process(delta):
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.die()
	queue_free()



func _on_dead_timer_timeout() -> void:
	queue_free()
