extends Camera2D

@onready var _player = get_node("../Player")
var target = self.position
var bound_offset = 80

var pos_bound = self.position.x + bound_offset
var neg_bound = self.position.x - bound_offset

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	#if _player.position.x > pos_bound or _player.position.x < neg_bound:
	#	pos_bound = lerp(pos_bound, _player.position.x + bound_offset, 0.1)
	#	neg_bound = lerp(neg_bound, _player.position.x - bound_offset, 0.1)
		
	#	target.x = lerp(target.x, _player.position.x, 0.20)
	#else:
	target.x = _player.position.x

	self.position.x = target.x
