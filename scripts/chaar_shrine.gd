extends StaticBody2D

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _texture = get_node("Sprite2D")
@onready var _chaar = self
@onready var intact_collider = $intact_collision
@onready var destroyed_collider = $destroyed_collision


var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_chaar.remove_child(destroyed_collider)
	_texture.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
