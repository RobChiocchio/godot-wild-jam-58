extends "res://scripts/blowable.gd"

var grounded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if get_contact_count() > 0:
		for bodies in get_colliding_bodies():
			if bodies.get_class() == "StaticBody2D":
				grounded = true
	else:
		grounded = false
		
	if grounded:
		angular_damp = 0
		linear_damp = 0
		gravity_scale = 1
	else:
		angular_damp = 5
		linear_damp = 3
		gravity_scale = 2
