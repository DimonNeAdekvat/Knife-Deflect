extends Sprite2D

@export var speed : float = 150.0
@export var the_chosen_one : bool = false

var velocity : Vector2 = Vector2()

func _ready():
	if(the_chosen_one):
		$DamageComponent.damage = 0
		$DamageComponent.set_deferred("monitoring", false)
		velocity = Vector2.ZERO
	else:
		velocity = Vector2.UP.rotated(self.rotation) * speed


func _process(delta):
	position += velocity * delta

func _on_damagebox_entered(area):
	if area is HitboxComponent : 
		call_deferred("rebase", area)
	elif area is DamageboxComponent:
		if($DamageboxComponent.monitoring):
			queue_free()

func rebase(area : Node2D):
	$DamageboxComponent.set_deferred("monitoring", false)
	set_process(false)
	var parent = area.get_parent()
	reparent(parent,true)
	
