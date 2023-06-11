extends Camera2D

@onready var _player = get_node("../Player")
var target = self.position

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _player:
		target = _player.position
		
	self.position.x = target.x
