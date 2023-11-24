extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		
	if direction == Vector2.ZERO:
		$AnimatedPlayerSprite.pause()
	else:
		$AnimatedPlayerSprite.play()
	
	position += direction.normalized() * delta * 200
