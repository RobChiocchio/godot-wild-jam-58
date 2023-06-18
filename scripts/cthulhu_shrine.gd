extends StaticBody2D

@onready var _next_indicator = get_node("next_indicator")

# Called when the node enters the scene tree for the first time.
func _ready():
	_next_indicator.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_final_statue_body_entered(body):
	if body.get_name() == "cthulhu_shrine":
		_next_indicator.visible = true
		notify_property_list_changed()
