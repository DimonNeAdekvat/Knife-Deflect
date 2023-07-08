extends Area2D
class_name HitboxComponent

@export var health : HealthComponent 

func _on_area_entered(area):
	if health == null :
		return
	if area is DamageboxComponent :
		health.damage(area.get_damage())
	
