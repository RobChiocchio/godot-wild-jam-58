extends Node2D

@onready var main_node = get_tree()
@onready var main_menu_ui_node = get_node("main_menu")
@onready var level_node = get_node("level")

# Called when the node enters the scene tree for the first time.
func _ready():
	for c in level_node.get_children():
		level_node.remove_child(c)
		c.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_level(scene: PackedScene):
	var instance = scene.instantiate()
	add_child(instance)

func _on_start_button_pressed():
	for c in main_menu_ui_node.get_children():
		main_menu_ui_node.remove_child(c)
		c.queue_free()
	load_level.call_deferred(load("res://scenes/level_1.tscn"))


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_credits_button_pressed():
	pass # Replace with function body.
