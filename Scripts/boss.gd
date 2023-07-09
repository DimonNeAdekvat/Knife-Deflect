extends Node2D

# Префабы ножей
@export var knives : Array[PackedScene]
@export var warning_scene: PackedScene = preload("res://Prefabs/warning.tscn")
@export var distance: float = 600.0
@export var spawn_time: float = 3.0
@export var boss_shift: float = 300.0
@export var angle_change : float = 0.3


var cur_angle : float = 0.0
var distance_boss : float = 0.0
var time : float = 0.0
var timer : float = 1.0
var score : int = 0

signal victory
signal score_changed(score : int)

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()

func new_game():
	$Timer.start(spawn_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	cur_angle += angle_change * delta
	time += delta
	distance_boss = boss_shift + boss_shift * cos(time) * 0.3
	$Boss_sprite.position = distance_boss * Vector2.RIGHT.rotated(cur_angle)
	$Boss_sprite.rotation = -cur_angle * 0.5
	if($Boss_sprite.get_child_count() == 0):
		emit_signal("victory")
		set_process(false)
		$Timer.stop()
		queue_free()

func on_score_increase():
	score += 1
	emit_signal("score_changed", score)

func spawn_on_circle():
	var rand = randi() % knives.size()
	var dir: Vector2 = Vector2.LEFT.rotated(cur_angle)
	var attack : Node2D = knives[rand].instantiate()
	var warning : Node2D = warning_scene.instantiate()
	attack.position = dir * distance
	attack.rotation = cur_angle - PI * 1.5
	attack.connect("increase_score", on_score_increase)
	add_child(attack)
	warning.max_dist = distance
	attack.add_child(warning)
