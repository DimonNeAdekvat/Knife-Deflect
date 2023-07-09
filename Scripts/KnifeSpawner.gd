extends Node2D

# Префабы ножей
@export var knives : Array[PackedScene]
# Ограничение угла, с которого можно запустить нож  [0, 2PI]
@export var positions : Array[Vector2]
# Типы запускаемых ножей
@export var types : Array[int]
#@export var knife_scene: PackedScene = preload("res://Prefabs/knife.tscn")
@export var warning_scene: PackedScene = preload("res://Prefabs/warning.tscn")
@export var distance: float = 600.0
@export var spawn_time: float = 3.0

signal victory
signal score_changed(score : int)

var cur_index : int = 0
var score : int = 0

func new_game():
	$MobTimer.wait_time = spawn_time
	$MobTimer.start()

func _ready():
	new_game()
	
func _physics_process(_delta):
	if(cur_index <= positions.size() - 1):
		return
	if(get_child_count() == 1):
		emit_signal("victory")
		set_physics_process(false)

func _on_mob_timer_timeout():
	spawn_on_circle()
	
func on_score_increase():
	score += 1
	emit_signal("score_changed", score)

func spawn_on_circle():
	var rand: float = (randf() * (positions[cur_index].y - positions[cur_index].x) + positions[cur_index].x) * PI
	var dir: Vector2 = Vector2(cos(rand), sin(rand))
	var attack : Node2D = knives[types[cur_index]].instantiate()
	if(attack is Empty):
		cur_index += 1
		return
	var warning : Node2D = warning_scene.instantiate()
	attack.position = dir * distance
	attack.rotation = rand - PI * 0.5
	attack.connect("increase_score", on_score_increase)
	add_child(attack)
	warning.max_dist = distance
	attack.add_child(warning)
	if(cur_index == positions.size() - 1):
		$MobTimer.stop()
	cur_index += 1
	
