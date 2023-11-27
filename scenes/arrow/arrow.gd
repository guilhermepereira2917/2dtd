extends Node2D

class_name Arrow

var direction: Vector2
var velocity: int = 600
var damage: int = 1

func _process(delta: float) -> void:
	position += direction * velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	var enemy: Enemy = area.get_parent() as Enemy
	var health_component: HealthComponent = enemy.get_node("HealthComponent")
	health_component.receive_damage(damage)
	
	queue_free()
