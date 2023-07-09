extends Control

@export var go_back : PackedScene
@export var levels : Array[PackedScene]
@onready var grid = $MarginContainer/Grid

var offset : int = 0
var loader = LevelLoader.new()

func _ready():
	setup_buttons()

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		_to_main()

var icon_prev = preload("res://feathericons/arrow-left.svg")
var icon_next = preload("res://feathericons/arrow-right.svg")
var icon_back = preload("res://feathericons/home.svg")

func setup_buttons():
	#clear grid
	for child in grid.get_children() :
		child.queue_free()
	
	var levels_count = len(levels)
	var is_first_page : bool = offset == 0
	var has_next_page : bool = (levels_count - offset) > 14 
	#setup baack button
	var back_button = Button.new()
	back_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	back_button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	back_button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	if is_first_page :
		back_button.icon = icon_back
		back_button.connect("pressed",_to_main)
	else :
		back_button.icon = icon_prev
		back_button.connect("pressed",_prev_page)
	grid.add_child(back_button)
	
	
	var level_buttotns_count : int = 14
	if has_next_page :
		level_buttotns_count -= 1
	
	var curr_indx : int = 0 
	for i in level_buttotns_count:
		curr_indx = offset + i
		var new_node : Control = Control.new()
		if curr_indx < levels_count:
			new_node = Button.new()
			new_node.text = var_to_str(curr_indx + 1)
			new_node.pressed.connect(_change_scene.bind(curr_indx))
		new_node.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		new_node.size_flags_vertical = Control.SIZE_EXPAND_FILL
		grid.add_child(new_node)
	
	
	if !has_next_page :
		return
	var next_button = Button.new()
	next_button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	next_button.size_flags_vertical = Control.SIZE_EXPAND_FILL
	next_button.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
	next_button.icon = icon_next
	next_button.connect("pressed",_next_page)
	grid.add_child(next_button)
	

func _to_main():
	get_tree().change_scene_to_packed(go_back)

func _prev_page():
	offset -= 13
	if offset < 0 :
		offset = 0
	setup_buttons()

func _next_page():
	offset += 13
	setup_buttons()

func _change_scene(index : int):
	var level = levels[index]
	if level != null :
		loader.load_pack(level)
	else :
		print("scene empty")
