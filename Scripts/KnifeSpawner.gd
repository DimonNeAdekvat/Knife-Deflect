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
	var rand: float = randf_range(0, 2*PI)
	var dir: Vector2 = Vector2(cos(rand), sin(rand))
	var knife : Node2D = knife_scene.instantiate()
	knife.position = dir * distance
	var warning : Sprite2D = warning_scene.instantiate()
	get_parent().add_child(warning)
	knife.child = warning
	warning.position = Vector2.ZERO
	knife.look_at(global_position)
	knife.rotation_degrees += 90
	warning.SetParent(knife)
	get_parent().add_child(knife)
	
