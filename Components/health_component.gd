extends Node
class_name HealthComponent

signal death
## health changed absolute value 
signal health_changed_a(health : float)
## health changed relative value
signal health_changed_r(health : float)

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
		emit_signal("health_changed_a",cur_health)
		emit_signal("health_changed_r",cur_health/max_health)

func damage(ammount : float):
	cur_health -= ammount

func heal(ammount : float):
	cur_health += ammount

func refresh():
	emit_signal("health_changed_a",cur_health)
	emit_signal("health_changed_r",cur_health/max_health)
