extends Node

@onready var _ending_node = self



func load_level(scene: PackedScene):
	var instance = scene.instantiate()
	add_child(instance)


func _on_return_button_pressed():
	for c in _ending_node.get_children():
		_ending_node.remove_child(c)
		c.queue_free()
	load_level.call_deferred(load("res://scenes/main.tscn"))
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
