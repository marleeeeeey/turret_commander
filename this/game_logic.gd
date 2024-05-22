class_name GameLogic extends Node2D

signal on_game_over

@export var enemy_scene: PackedScene

var enemy_spawn_period_sec = 1.0
var scores = 0


func _ready() -> void:
	$EnemySpawnTimer.start()
	_set_fort_health(100)
	_set_player_health(100)


func get_scores():
	return scores


func _on_enemy_spawn_timer_timeout() -> void:
	# Create a new instance of the Mob scene.
	var enemy: Enemy = enemy_scene.instantiate()

	# Set the enemy's position to a random location on the path.
	var mob_spawn_location = $EnemySpawnPath/PathFollow2D
	mob_spawn_location.progress_ratio = randf()
	enemy.position = mob_spawn_location.position
	enemy.on_die.connect(_on_enemy_die)

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
	$Hud.set_fort_health(health)


func _set_player_health(health: int) -> void:
	$Hud.set_player_health(health)


func _on_enemy_die() -> void:
	scores += 1
	$Hud.set_player_scores(scores)
