extends Area2D

var speed = 2500


func _physics_process(delta):
	position += transform.x * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.die()
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
