extends CharacterBody2D


@export var spin_velocity : float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var screen_size : Vector2 = DisplayServer.window_get_size()

func _ready():
	position = screen_size / 2
	print(screen_size)

func _physics_process(delta):
	pass
