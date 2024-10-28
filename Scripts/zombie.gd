extends CharacterBody2D


@onready var given_x = self.position.x
@onready var given_y = self.position.y
var speed = .5
var seen_ = false
var hearing = false
var timer = 0.0
var interval = 5.0

func _physics_process(_delta):
	timer += _delta
	
	if seen_ == true:
		print("Self:", self.position.y, " " , self.position.x)
		look_at(Vector2(given_x,given_y))
		if self.position.y < given_y:
			self.position.y += speed
		else:
			self.position.y -= speed

		if self.position.x < given_x:
			self.position.x +=  speed
		else:
			self.position.x -= speed
		seen()

		
		
	elif hearing == true:
		look_at(Vector2(given_x,given_y))
		
		if self.position.x < given_x:
			self.position.x += speed
		else:
			self.position.x -= speed

		if self.position.y < given_y:
			self.position.y += speed
		else:
			self.position.y -= speed
	else:
		look_at(Vector2(given_x,given_y))
		
		if self.position.x < given_x:
			self.position.x += speed
		else:
			self.position.x -= speed

		if self.position.y < given_y:
			self.position.y += speed
		else:
			self.position.y -= speed
		if timer >= interval:
			timer = 0
			random_movement()
		
	

	

func investigate():
	
		given_x = Global.player_noise_x
		given_y = Global.player_noise_y
		hearing = true
	
	
	# changes the x and y to be the player x and y

	

func seen():
	
		given_x = Global.player_pos_x
		given_y = Global.player_pos_y
		print("Given", given_x, " ", given_y)

		seen_ = true

	

func random_movement():
	print("going in random direction")
	given_x = randi_range(-100, 100)
	given_y = randi_range(-100, 100)
	print(given_x)
	print(given_y)
	

func _on_hearing_body_entered(body):
	if body.has_method("get_input"):
		if Global.player_noise > 40:
			print("investigating")
			investigate()


func _on_hearing_body_exited(body):
	if body.has_method("get_input"):
		hearing = false
		random_movement()


func _on_vision_cone_body_exited(body):
	if body.has_method("get_input"):
		seen_ = false
		print("bye")
		random_movement()


func _on_vision_cone_body_entered(body):
	if body.has_method("get_input"):
		print("hi")
		seen()
