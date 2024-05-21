extends StaticBody2D

signal health_changed(health: int)

var health = 100


func damage(dmg: int):
	health -= dmg
	health_changed.emit(health)
