extends CharacterBody2D


func _physics_process(_delta):
	look_at(get_global_mouse_position())
	# Add the gravity.
	

	