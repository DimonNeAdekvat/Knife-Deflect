extends CharacterBody2D

class_name Log

@export var spin_velocity : float = 80.0
@export var angular_damp : float = 40.0
@export var max_angular_velocity : float = 100.0

var angular_velocity : float = 0.0 :
	set(val):
		if(sign(val) >= 0):
			angular_velocity = min(val, max_angular_velocity)
		else:
			angular_velocity = max(val, -max_angular_velocity)

func _physics_process(delta):
	rotation_degrees += angular_velocity * delta
	angular_velocity -= signf(angular_velocity) * delta * angular_damp
	if Input.is_action_pressed("on_click"):
		spin(get_global_mouse_position().x, delta)
	elif Input.is_action_pressed("spin_left"):
		spin(-1.0, delta)
	elif Input.is_action_pressed("spin_right"):
		spin(1.0, delta)
	else:
		pass

func spin(val : float, delta):
	angular_velocity += sign(val) * spin_velocity * delta
