extends Sprite2D

@export var speed : float = 100.0

var velocity : Vector2 = Vector2()

func _ready():
	top_level = true
	velocity = Vector2.UP.rotated(self.rotation) * speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta


func _on_damagebox_entered(area):
	if area is HitboxComponent : 
		$DamageboxComponent.set_deferred("monitoring",false)
		set_process(false)
		reparent(area.get_parent(),true)
		top_level = false
