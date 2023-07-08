extends Node2D

@export var knife_scene: PackedScene = preload("res://Prefabs/knife.tscn")
@export var warning_scene: PackedScene = preload("res://Prefabs/warning.tscn")
@export var distance: float = 600.0

func new_game():
	$MobTimer.start()

func _ready():
	new_game()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mob_timer_timeout():
	spawn_on_circle()

func spawn_on_circle():
	var rand: float = randf()*2*PI
	var dir: Vector2 = Vector2(cos(rand), sin(rand))
	var attack : Node2D = knife_scene.instantiate()
	var warning : Node2D = warning_scene.instantiate()
	attack.position = dir * distance
	attack.rotation = rand - PI * 0.5
	add_child(attack)
	warning.max_dist = distance
	attack.add_child(warning)
	
