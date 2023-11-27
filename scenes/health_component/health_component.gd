extends Node

class_name HealthComponent

signal health_depleted
signal damage_taken

@export var max_health: int
var current_health: int

func _ready() -> void:
	current_health = max_health

func receive_damage(amount: int) -> void:
	if current_health == 0:
		return
	
	current_health -= amount
	if current_health <= 0:
		current_health = 0
	
	damage_taken.emit()
	
	if current_health == 0:
		health_depleted.emit()
