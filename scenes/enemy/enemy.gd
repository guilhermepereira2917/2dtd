extends Node2D

class_name Enemy

signal reached_end
signal died

var path_follow: PathFollow2D
var velocity: int = 300;

func _ready() -> void:
	$AnimatedSprite2D.play()

func _process(delta: float) -> void:
	path_follow.progress += velocity * delta;
	
	if path_follow.progress_ratio < 1:
		return
	
	reached_end.emit()
	path_follow.queue_free()

func _on_health_component_health_depleted() -> void:
	died.emit()
	queue_free()
