extends Node2D

class_name Arrow

var direction: Vector2
var velocity = 600

func _process(delta: float) -> void:
	position += direction * velocity * delta

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
