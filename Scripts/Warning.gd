extends Sprite2D

@export var show_rad : float = 280.0
@export var color_s : Color = Color.GREEN
@export var color_e : Color = Color.RED

var max_dist : float = 400

var transparency : float = 0.5
var d_rect : Rect2 = Rect2()
var dist_to_s : float = 0.0

func _ready():
	top_level = true
	d_rect = get_viewport_rect()
	d_rect.position = get_viewport_transform().inverse() * d_rect.position
	global_position = intersect(get_parent().rotation)
	global_rotation = get_parent().global_rotation
	dist_to_s = global_position.length_squared()
	self.modulate.a = 0.0
	pass

func _process(_delta):
	var dist_to_p : float = get_parent().position.length_squared()
	var to_visible : float = (dist_to_p - dist_to_s) / (max_dist * max_dist - dist_to_s) 
	var opacity : float = min(1.0,1.0 - max(0.0,to_visible))
	if to_visible < 0.0 :
		opacity = 0.0
		hide()
		queue_free()
	var color_f : Color = lerp(color_s,color_e,opacity)
	self.modulate = color_f
	self.modulate.a = opacity

func intersect(angle : float) -> Vector2 :
	var dir = Vector2.DOWN.rotated(angle) * show_rad
	var r_pos = d_rect.position
	var r_end = d_rect.end

	if dir.y < r_pos.y :
		dir *= r_pos.y / dir.y
	if dir.y > r_end.y :
		dir *= r_end.y / dir.y
	if dir.x < r_pos.x :
		dir *= r_pos.x / dir.x
	if dir.x > r_end.x :
		dir *= r_end.x / dir.x

	return dir
