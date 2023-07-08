extends Sprite2D

@export var speed : float = 150.0

var velocity : Vector2 = Vector2()
var child = null

func _ready():
	velocity = Vector2.UP.rotated(self.rotation) * speed


func _process(delta):
	position += velocity * delta
	if(child != null):
		child.SetDistance()
		if(global_position.length() < child.global_position.length()):
			child.queue_free()


func _on_damagebox_entered(area):
	if area is HitboxComponent : 
		call_deferred("rebase",area)
	elif area is DamageboxComponent:
		queue_free()

func rebase(area : Node2D):
	$DamageboxComponent.set_deferred("monitoring",false)
	set_process(false)
	var parent = area.get_parent()
	reparent(parent,true)
	
