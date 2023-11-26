extends Node2D

class_name Enemy

signal reached_end

var path_follow: PathFollow2D
var velocity: int = 300;

func _process(delta: float) -> void:
	path_follow.progress += velocity * delta;
	
	if path_follow.progress_ratio < 1:
		return
	
	reached_end.emit()
	path_follow.queue_free()
