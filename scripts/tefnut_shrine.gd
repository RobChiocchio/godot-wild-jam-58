extends Node2D

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _tefnut = self
@onready var intact_collider = $intact_colllision
@onready var destroyed_collider = $destroyed_collision

# Called when the node enters the scene tree for the first time.
func _ready():
	_tefnut.remove_child(destroyed_collider)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_left_rock_body_entered(body):
	print(body.name)
	if body.name == "tefnut_shrine":
		_sprite.play("tefnut_leaves")
		_tefnut.add_child(destroyed_collider)
		_tefnut.remove_child(intact_collider)
		
func _on_right_rock_body_entered(body):
	_sprite.play("tefnut_leaves")



