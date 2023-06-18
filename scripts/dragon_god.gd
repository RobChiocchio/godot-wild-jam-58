extends StaticBody2D

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _collider = get_node("CollisionPolygon2D")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_metal_statue_body_entered(body):
	if body.name == "dragon_god":
		_sprite.play("destroyed_shrine")
		notify_property_list_changed()
