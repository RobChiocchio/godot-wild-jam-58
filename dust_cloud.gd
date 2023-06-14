extends RigidBody2D

var was_airborn = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_on_floor() and was_airborn == true:
		
	else:
		was_airborn = true
