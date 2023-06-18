extends AudioStreamPlayer2D

@onready var _lightning_audio_node = self

var struck = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_dragon_god_property_list_changed():
	if struck == false:
		_lightning_audio_node.play()
		struck = true


func _on_tefnut_shrine_property_list_changed():
	if struck == false:
		_lightning_audio_node.play()
		struck = true


func _on_cthulhu_shrine_property_list_changed():
	if struck == false:
		_lightning_audio_node.play()
		struck = true


func _on_chaar_shrine_property_list_changed():
	if struck == false:
		_lightning_audio_node.play()
		struck = true
