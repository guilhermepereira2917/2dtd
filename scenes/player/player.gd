extends Node2D

var arrow_scene: PackedScene = preload("res://scenes/arrow/arrow.tscn");
var can_shoot: bool = true

func _process(delta: float) -> void:
	process_movement(delta)
	process_shooting()

func process_movement(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"):
		$AnimatedPlayerSprite.play("frente")
		direction.y += 1
	if Input.is_action_pressed("move_right"):
		$AnimatedPlayerSprite.play("lado")
		scale.x = 1
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_left"):
		$AnimatedPlayerSprite.play("lado")
		scale.x = -1
		direction.x -= 1
		
	if direction == Vector2.ZERO:
		$AnimatedPlayerSprite.pause()
	
	position += direction.normalized() * delta * 200

func process_shooting() -> void:
	if not Input.is_action_just_pressed("left_click") or not can_shoot:
		return
	
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	
	var arrow: Arrow = arrow_scene.instantiate()
	arrow.position = self.position
	arrow.direction = mouse_position - position
	arrow.rotation = position.angle_to_point(mouse_position) + PI
	arrow.direction = arrow.direction.normalized()
	
	get_parent().add_child(arrow)
	
	can_shoot = false
	$ShotTimer.start()

func _on_shot_timer_timeout() -> void:
	can_shoot = true
