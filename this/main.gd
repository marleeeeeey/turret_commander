extends Node2D

@export var enemy_scene: PackedScene


func _on_enemy_spawn_timer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var enemy = enemy_scene.instantiate()

	# Set the enemy's position to a random location on the path.
	var mob_spawn_location = $EnemySpawnPath/PathFollow2D
	mob_spawn_location.progress_ratio = randf()
	enemy.position = mob_spawn_location.position

	$NavigationRegion2D.add_child(enemy)


func _on_fort_area_body_entered(body: Node2D) -> void:
	var enemy = body as Enemy
	if enemy:
		print("game over")
