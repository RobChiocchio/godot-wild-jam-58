extends Node2D

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _tefnut = self
@onready var intact_collider = $intact_collision
@onready var destroyed_collider = $destroyed_collision

var destroyed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_tefnut.remove_child(destroyed_collider)

func _process(_delta):
	if destroyed:
		notify_property_list_changed()
	
func _change_colliders():
	_tefnut.add_child(destroyed_collider)
	_tefnut.remove_child(intact_collider)

func _on_rock_left_body_entered(body):
	if body.name == "tefnut_shrine" and destroyed == false:
		_sprite.play("tefnut_leaves")
		call_deferred("_change_colliders")
		destroyed = true
		notify_property_list_changed()

func _on_rock_right_body_entered(body):
	if body.name == "tefnut_shrine" and destroyed == false:
		_sprite.play("tefnut_leaves")
		call_deferred("_change_colliders")
		destroyed = true
		notify_property_list_changed()
