extends Area2D

@export var max_force: float = 200
@export var aim_direction := Vector2()

@onready var _player = get_parent()
@onready var _collider = $Collider

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_pos = _player.global_transform.origin
	var target_pos = get_global_mouse_position()
	
	aim_direction = (target_pos - player_pos).normalized()
	
	if Input.is_action_pressed("blow"):
		#_collider.look_at(aim_direction)
		_collider.look_at(target_pos)
		_collider.disabled = false
		_collider.visible = true
	else:
		_collider.disabled = true
		_collider.visible = false
