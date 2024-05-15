extends StaticBody2D

@export var bullet_scene: PackedScene
@export var shooting_interval = 1.0
@export var range = 500

var target = null


func _ready() -> void:
	$ShootingTimer.wait_time = shooting_interval
	$ShootingTimer.start()

	var scan_circle: CircleShape2D = $ScanArea/CollisionShape2D.shape
	scan_circle.radius = range


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	target = _get_closest_target()
	if target:
		look_at(target.global_position)


func _get_closest_target() -> Node2D:
	var closest_target = null
	var closest_dist = range
	for body in $ScanArea.get_overlapping_bodies():
		if body.is_in_group("enemies"):
			var dist = global_position.distance_to(body.global_position)
			if dist < closest_dist:
				closest_target = body
				closest_dist = dist
	return closest_target


func _on_shooting_timer_timeout() -> void:
	if target:
		_shoot()


func _shoot():
	var bullet = bullet_scene.instantiate()
	owner.add_child(bullet)
	bullet.transform = $BulletSpawnPoint.global_transform
