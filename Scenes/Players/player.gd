extends CharacterBody2D


const SPEED = 350.0
const JUMP_VELOCITY = -500.0
@onready var animated_sprite_2d = $AnimatedSprite2D
var isFacingLeft = false
@export var isClimbing = false
@export var isPlayer = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if isClimbing == true:
		velocity.y = 0
		if Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("ui_down"):
			velocity.y = SPEED

	# Animations
	if velocity.x > 1 || velocity.x < -1:
		# animated_sprite_2d.animation = "running"
		animated_sprite_2d.play("running")
	else:
		animated_sprite_2d.play("idle")
		
	# Add the gravity.
	if not is_on_floor() and isClimbing == false:
		velocity.y += gravity * delta
		animated_sprite_2d.play("jumping")

	# Handle jump.
	if (Input.is_action_just_pressed("ui_accept") and is_on_floor()) or (Input.is_action_pressed("ui_up") and isClimbing):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if velocity.x < 0:
		isFacingLeft = true
	elif velocity.x > 0:
		isFacingLeft = false
		
	animated_sprite_2d.flip_h = isFacingLeft
