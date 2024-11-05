extends CharacterBody2D

@export var speed = 100
@onready var animation = $AnimationPlayer


func _physics_process(delta):
	
	move_and_slide()
	get_input()

func get_input():
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var down = Input.is_action_pressed("ui_down")
	var up = Input.is_action_pressed("ui_up")
	var input_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")

	if right == true:
		animation.play("walking_right")
		
	elif left == true:
		animation.play("walking_left")
		
	elif up == true:
		animation.play("walking_up")
		
	elif down == true:
		animation.play("walking_down")
		
	elif (left && up) == true:
		animation.play("walking_top_left")
		
	elif (right and up) == true:
		animation.play("walking_top_right")
		
	elif (left == true) and (down == true):
		animation.play("walking_bottom_left")
		
	elif (right && down) == true:
		animation.play("walking_bottom_right")

	else:
		animation.play("idle")

	velocity = input_direction * speed
