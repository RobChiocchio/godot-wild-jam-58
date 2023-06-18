extends StaticBody2D

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _texture = get_node("Sprite2D")
@onready var _chaar = self
@onready var intact_collider = $intact_collision
@onready var destroyed_collider = $destroyed_collision

var _bomb_overlap = false
var _exploded = false
var _strike = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_chaar.remove_child(destroyed_collider)
	_texture.visible = false
	
func _change_colliders():
	_chaar.add_child(destroyed_collider)
	_chaar.remove_child(intact_collider)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if _strike == true and _exploded == false and _bomb_overlap == true:
		call_deferred("_change_colliders")
		_texture.visible = true
		_sprite.visible = false
		_exploded = true
		notify_property_list_changed()


func _on_bomb_body_entered(body):
	if body.name == "chaar_shrine" and _bomb_overlap == false:
		_bomb_overlap = true
		#print("there's a bomb")


func _on_bomb_body_exited(body):
	if body.name == "chaar_shrine":
		_bomb_overlap = false
		#print("the bomb is gone")
