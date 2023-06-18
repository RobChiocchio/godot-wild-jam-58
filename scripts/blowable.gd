extends RigidBody2D

var grounded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func succ(force) -> void:
	self.apply_central_force(force)
	
	
func _physics_process(_delta):
	if get_contact_count() > 0:
		for bodies in get_colliding_bodies():
			if bodies.get_class() == "StaticBody2D":
				grounded = true
	else:
		grounded = false
		
	if grounded:
		angular_damp = 2
		linear_damp = 0
		gravity_scale = 1
	else:
		angular_damp = 5
		linear_damp = 3
		gravity_scale = 2
