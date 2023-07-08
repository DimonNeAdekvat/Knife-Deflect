extends Sprite2D

@export var displace : float = 32

@onready var transparency : float = 0.5
@onready var distance : float
@onready var max_distance: float = 0
@onready var screen_size: Vector2 = DisplayServer.window_get_size()
@onready var parent : Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.self_modulate.a = transparency

func SetDistance():
	distance = (parent.global_position - global_position).length()
	position.x = sign(parent.global_position.x) * min((screen_size.x / 2 - displace), abs(parent.global_position.x))
	position.y = sign(parent.global_position.y) * min((screen_size.y / 2 - displace), abs(parent.global_position.y))
	transparency = 1 - min((max_distance - distance)/max_distance, 254.0/255.0)
	self.self_modulate.a = transparency
	if(max_distance == 0):
		max_distance = distance
	
func SetParent(p : Sprite2D):
	parent = p
	position.x = sign(parent.global_position.x) * min((screen_size.x / 2 - displace), abs(parent.global_position.x))
	position.y = sign(parent.global_position.y) * min((screen_size.y / 2 - displace), abs(parent.global_position.y))
	rotation = parent.rotation
	distance = (parent.global_position - global_position).length()
	self.self_modulate.a = transparency
