extends Node

@onready var _rope_and_bomb = self
@onready var _rope = _rope_and_bomb.get_node("rope")
@onready var _bomb = $bomb

@onready var _rope_without = _rope.get_node("rope_without_bomb")
@onready var _rope_with = _rope.get_node("rope_with_bomb")

var cut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_rope_and_bomb.remove_child(_bomb)
	_rope.remove_child(_rope_without)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _cut():
	_rope.remove_child(_rope_with)
	_rope.add_child(_rope_without)
	_rope_and_bomb.add_child(_bomb)

func _on_stone_statue_body_entered(body):
	if body.name == "rope" and cut == false:
		call_deferred("_cut")
		cut = true

