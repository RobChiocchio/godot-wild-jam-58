extends AudioStreamPlayer2D

@onready var _collapse_node = self

var collapse = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_tefnut_shrine_property_list_changed():
	if collapse == false:
		_collapse_node.play()
		collapse = true
