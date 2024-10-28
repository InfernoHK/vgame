extends CharacterBody2D

@export var speed = 50



func _physics_process(_delta):
	get_input()
	move_and_slide()
	
	look_at(get_global_mouse_position())
	if Global.player_noise > 40:
		Global.player_noise_x = self.position.x
		Global.player_noise_y = self.position.y
	else:
		Global.player_pos_x = self.position.x
		Global.player_pos_y = self.position.y

	

	

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var input_sprint = Input.is_action_pressed("Sprint")
	if input_sprint == true:
		speed = 100
		Global.player_noise = 50
		print(Global.player_noise)
	else:
		speed = 50
		Global.player_noise = 10

	velocity = input_direction * speed

	
	
