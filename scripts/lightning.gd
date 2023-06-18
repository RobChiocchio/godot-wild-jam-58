extends Node2D

@onready var _sprite = get_node("lightning_strike")


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_metal_statue_body_entered(body):
	if body.name == "dragon_god":
		self.visible = true
		_sprite.play("strike")


func _on_final_statue_body_entered(body):
	if body.name == "cthulhu_shrine":
		self.visible = true
		_sprite.play("strike")
