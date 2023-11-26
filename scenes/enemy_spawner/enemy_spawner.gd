extends Node

@export var path: Path2D
@export var enemy: PackedScene
@export var cooldown: float = 1
@export var enemies_to_spawn: int = 0

var spawned_enemies: int = 0

func _ready() -> void:
	$Timer.wait_time = cooldown

func _on_timer_timeout() -> void:
	spawn_enemy()

func spawn_enemy() -> void:
	if (spawned_enemies >= enemies_to_spawn):
		if not $Timer.is_stopped():
			$Timer.stop()
		
		return
	
	var path_follow: PathFollow2D = PathFollow2D.new()
	path_follow.rotates = false
	path_follow.loop = false
	
	var enemy_instantiated: Enemy = enemy.instantiate()
	enemy_instantiated.path_follow = path_follow
	
	path_follow.add_child(enemy_instantiated)
	path.add_child(path_follow)
	
	spawned_enemies += 1
