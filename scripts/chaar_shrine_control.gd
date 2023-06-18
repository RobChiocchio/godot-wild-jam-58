extends Node

@onready var _control = self
@onready var _chaar = _control.get_node("chaar_shrine")
@onready var _lightning = get_node("lightning")
@onready var _lightning_strike = _lightning.get_node("lightning_strike")

@onready var _next_indicator = get_node("next_indicator")

var struck = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_next_indicator.visible = false

func _on_metal_statue_body_entered(body):
	if body.name == "chaar_shrine" and struck == false:
		_lightning_strike.play("strike")
		_chaar.set("_strike", true)
		struck = true


func _on_metal_statue_body_exited(body):
	if body.name == "chaar_shrine":
		_chaar.set("_strike", false)
		struck = false


func _on_chaar_shrine_property_list_changed():
	_next_indicator.visible = true
