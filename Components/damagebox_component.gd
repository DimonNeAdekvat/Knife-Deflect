extends Area2D
class_name DamageboxComponent

@export var damage_component : DamageComponent

func get_damage() -> float:
	var damage : float = 0.0
	if damage_component != null :
		damage = damage_component.damage
	return damage
