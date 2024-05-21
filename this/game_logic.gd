class_name GameLogic extends Node2D

signal on_game_over

@export var enemy_scene: PackedScene


func _ready() -> void:
	$EnemySpawnTimer.start()
	_set_fort_health(100)
	_set_player_health(100)


func _on_enemy_spawn_timer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var enemy = enemy_scene.instantiate()

	# Set the enemy's position to a random location on the path.
	var mob_spawn_location = $EnemySpawnPath/PathFollow2D
	mob_spawn_location.progress_ratio = randf()
	enemy.position = mob_spawn_location.position

	$NavigationRegion2D.add_child(enemy)


func _game_over():
	on_game_over.emit()


func _on_fort_area_health_changed(health: int) -> void:
	print("Fort area health changed to: ", health)
	_set_fort_health(health)
	if health <= 0:
		_game_over()


func _on_player_health_changed(health: int) -> void:
	print("Player health changed to: ", health)
	_set_player_health(health)
	if health <= 0:
		_game_over()


func _set_fort_health(health: int) -> void:
	$Hud.set_top_left_label("Fort Health: " + str(health))


func _set_player_health(health: int) -> void:
	$Hud.set_top_right_label("Player Health: " + str(health))
