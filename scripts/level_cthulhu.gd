extends Node2D

@onready var _level_cthulhu_node = self


func load_level(scene: PackedScene):
	var instance = scene.instantiate()
	add_child(instance)

func _on_player_property_list_changed():
	for c in _level_cthulhu_node.get_children():
		_level_cthulhu_node.remove_child(c)
		c.queue_free()
	load_level.call_deferred(load("res://scenes/levels/ending.tscn"))
