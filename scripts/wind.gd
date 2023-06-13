extends Area2D

@export var max_force: float = 1000
@export var aim_direction := Vector2()

@onready var _player = get_parent()
@onready var _collider = $Collider
@onready var _sprite = $Collider/AnimatedSprite2D

var deadzone = 0.25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var player_pos = _player.global_transform.origin
	var target_pos = get_global_mouse_position()
	
	var joystick_vector = Vector2()
	joystick_vector.x = Input.get_joy_axis(1, JOY_AXIS_RIGHT_X)
	joystick_vector.y = Input.get_joy_axis(1, JOY_AXIS_RIGHT_Y)

	if abs(joystick_vector.x) > deadzone or abs(joystick_vector.y) > deadzone:
		aim_direction = joystick_vector.normalized()
	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			aim_direction = (target_pos - player_pos).normalized()

	
	if Input.is_action_pressed("blow") or Input.is_action_pressed("succ"):
		_collider.look_at(_player.position + aim_direction)
		_collider.disabled = false
		_collider.visible = true
		
		var mult = 1
		if Input.is_action_pressed("succ"):
			mult = -1
			_sprite.play("succ")
			_sprite.flip_h = true
			_sprite.flip_v = true
		else:
			_sprite.play("blow")
			_sprite.flip_h = false
			_sprite.flip_v = false
			
		var bodies = get_overlapping_bodies()
		for body in bodies:
			if body.has_method("succ"):
				var distance = body.position.distance_to(_player.position)
				var strength = max_force #max(max_force - log(distance), 0)
				var force = aim_direction * strength * mult
				force.y = force.y * 0.25 # hack fix
				body.succ(force)
				
	else:
		_collider.disabled = true
		_collider.visible = false
