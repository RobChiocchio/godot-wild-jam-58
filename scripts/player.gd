extends CharacterBody2D


const SPEED = 250.0
const JUMP_VELOCITY = -300.0
const AIR_DRAG = 100.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var _sprite = $AnimatedSprite2D
@onready var _player = self

@onready var left_box = $collision_left
@onready var right_box = $collision_right

func _process(delta):
	pass

func _physics_process(delta):

	# Add the gravity.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	var grounded = is_on_floor()
	
	var facing = false
	
	if Input.is_action_pressed("move_left") && _sprite.flip_h == true:
		facing = true
	
	if Input.is_action_pressed("move_right") && _sprite.flip_h == false:
		facing = true
	
	#airborn character control
	if not grounded:
		#Input timer for double tap
		velocity.y += gravity * delta
		
		if direction:
			if facing:
				velocity.x = move_toward(velocity.x, direction*SPEED, SPEED/5)
			else:
				velocity.x = move_toward(velocity.x, direction*SPEED/1.2, SPEED/12)
		else:
			velocity.x = lerp(velocity.x, 0.0, 0.1)

	# Grounded character control
	if grounded:
		if direction:
			velocity.x = direction * SPEED
			_sprite.play("walk")
		else:
			velocity.x = lerp(velocity.x, 0.0, 0.8)
			_sprite.stop()
			
		# Flip sprite if move left
		if Input.is_action_pressed("move_left") and _sprite.flip_h == false:
			_sprite.flip_h = true
			left_box.disabled = false
			left_box.visible = true
			right_box.disabled = true
			right_box.visible = false
		
		if Input.is_action_pressed("move_right"):
			_sprite.flip_h = false
			left_box.disabled = true
			left_box.visible = false
			right_box.disabled = false
			right_box.visible = true
			
		# Handle Jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			_sprite.stop()
	
	move_and_slide()
