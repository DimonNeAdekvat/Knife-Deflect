extends CharacterBody2D

class_name Log

@export var spin_velocity : float = 40.0
@export var angular_damp : float = 1.0
@export var max_angular_vel : float = 100.0

var rotat_vel : float = 0.0 :
	set(val):
		var sign = signf(val)
		var absl = abs(val)
		if absl > max_angular_vel:
			absl = max_angular_vel
		rotat_vel = sign * absl

func _physics_process(delta):
	rotation_degrees += rotat_vel * delta
	rotat_vel -= signf(rotat_vel) * delta * angular_damp
	if Input.is_action_just_pressed("ui_left"):
		rotate_left()
	if Input.is_action_just_pressed("ui_right"):
		rotate_right()

func rotate_left():
	rotat_vel += spin_velocity

func rotate_right():
	rotat_vel -= spin_velocity
