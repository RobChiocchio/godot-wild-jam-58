extends Node2D

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _tefnut = self
@onready var intact_collider = $intact_colllision
@onready var destroyed_collider = $destroyed_collision

var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_tefnut.remove_child(destroyed_collider)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _change_colliders():
	_tefnut.add_child(destroyed_collider)
	_tefnut.remove_child(intact_collider)

func _on_left_rock_body_entered(body):
	print(body.name)
	if body.name == "tefnut_shrine" and destroyed == false:
		_sprite.play("tefnut_leaves")
		call_deferred("_change_colliders")
		destroyed = true
		
func _on_right_rock_body_entered(body):
	_sprite.play("tefnut_leaves")



