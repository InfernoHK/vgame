extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta):
	pass

func investigate():
	#if body detects noise run go to last noisy x-y cordinate
	pass

func seen():
	#if in vision cone follow player until out of sight then return to random movement
	pass

func random_movement():
	#randomly go anywhere with no real reason until investiate or seen is proc'd
	pass
