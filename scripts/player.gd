extends CharacterBody2D



@export var speed: float = 200.0  # Player movement speed



func _ready():
	# Get the viewport size
	var viewport_size = get_viewport_rect().size

	# Set player's position to the center
	position = viewport_size / 2
	
	
	

func _physics_process(delta):
	var direction = Vector2.ZERO  # Start with no movement

	# Detect input for movement
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1

	# Normalize direction to prevent diagonal movement from being faster
	if direction != Vector2.ZERO:
		direction = direction.normalized()

	# Move the player
	velocity = direction * speed
	move_and_slide()  # Use move_and_collide() if handling collisions manually




#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
