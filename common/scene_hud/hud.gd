extends CanvasLayer

var player_health = 0
var fort_health = 0
var player_scores = 0


func _ready() -> void:
	$TopCenterLabel.text = ""


func _process(delta: float) -> void:
	$TopCenterLabel.text = "Player HP: {0}    Fort HP: {1}    Scores: {2}".format(
		[player_health, fort_health, player_scores]
	)


func set_player_health(health: int) -> void:
	player_health = health


func set_fort_health(health: int) -> void:
	fort_health = health


func set_player_scores(scores: int) -> void:
	player_scores = scores
