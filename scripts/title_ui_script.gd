extends Node2D

@onready var main_node = get_tree()
@onready var main_menu_ui_node = get_node("main_menu")

@onready var credits_texture = get_node("main_menu/credits_ui/TextureRect")
@onready var back_button = get_node("main_menu/credits_ui/back_button")

@onready var start_button = get_node("main_menu/title_ui/start_button")
@onready var credits_button = get_node("main_menu/title_ui/credits_button")

# Called when the node enters the scene tree for the first time.
func _ready():
	credits_texture.visible = false
	back_button.visible = false
	back_button.disabled = true
#	for c in level_node.get_children():
#		level_node.remove_child(c)
#		c.queue_free()

func load_level(scene: PackedScene):
	var instance = scene.instantiate()
	add_child(instance)

func _on_start_button_pressed():
	for c in main_menu_ui_node.get_children():
		main_menu_ui_node.remove_child(c)
		c.queue_free()
	load_level.call_deferred(load("res://scenes/levels/level_tefnut.tscn"))


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_credits_button_pressed():
	start_button.disabled = true
	credits_button.disabled = true
	
	
	credits_texture.visible = true
	back_button.visible = true
	back_button.disabled = false

func _on_back_button_pressed():
	start_button.disabled = false
	credits_button.disabled = false
	
	credits_texture.visible = false
	back_button.visible = false
	back_button.disabled = true


func _on_exit_button_pressed():
	get_tree().quit()
