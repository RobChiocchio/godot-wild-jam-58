extends "res://scripts/blowable.gd"

@onready var _sprite = get_node("TextureRect")
var _set_off = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_chaar_shrine_property_list_changed():
	_sprite.visible = false

