class_name Hud extends CanvasLayer

var player_health = 0
var fort_health = 0
var player_scores = 0
var enemy_spawn_period_sec = 0.0
var turrets_count = 0
var turret_limits = 0


func _ready() -> void:
	$TopCenterLabel.text = ""


func _process(delta: float) -> void:
	$TopCenterLabel.text = (
		"Player HP: {0}    Fort HP: {1}    Scores: {2}    Spawn Period: {3}    Turrets: {4}/{5}"
		. format(
			[
				player_health,
				fort_health,
				player_scores,
				"%0.2f" % enemy_spawn_period_sec,
				turrets_count,
				turret_limits
			]
		)
	)


func set_player_health(health: int) -> void:
	player_health = health


func set_fort_health(health: int) -> void:
	fort_health = health


func set_player_scores(scores: int) -> void:
	player_scores = scores


func set_enemy_spawn_period_sec(period_sec: float) -> void:
	enemy_spawn_period_sec = period_sec


func set_turret_limit(count):
	turret_limits = count


func set_turret_count(count):
	turrets_count = count
