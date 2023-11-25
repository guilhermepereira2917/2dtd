extends Node2D

var enemies_velocity: int = 300;

func _process(delta: float) -> void:
	for path_follow in $LevelPath.get_children():
		path_follow.progress += enemies_velocity * delta;
		
		if path_follow.progress_ratio >= 1:
			path_follow.queue_free()
