extends Node
class_name HealthComponent

signal death

@export var max_health : float = 100.0:
	set(val):
		max_health = val
		if cur_health > max_health :
			cur_health = max_health
@export var cur_health : float = 100.0:
	set(val):
		cur_health = val
		if cur_health > max_health :
			cur_health = max_health
		if cur_health <= 0.0:
			cur_health = 0.0
			emit_signal("death")

func damage(ammount : float):
	cur_health -= ammount

func heal(ammount : float):
	cur_health += ammount
