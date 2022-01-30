extends Node


onready var viewer:Panel = get_parent().find_node("Viewer")
onready var viewport:Viewport = viewer.viewport
onready var sidebar:HBoxContainer = get_parent().find_node("Sidebar")

var texture:Texture
var gen:Generator

var generators:Array = [
	load("res://src/generators/gen_grid_line.gd"),
	load("res://src/generators/gen_grid_dot.gd"),
	load("res://src/generators/gen_simplexnoise.gd"),
	load("res://src/generators/gen_wallpaper_ripple.gd"),
	load("res://src/generators/gen_stripes.gd"),
]


func _ready() -> void:
	change_generator(0)
	
func _process(delta: float) -> void:
	pass
	
func change_generator(index:int) -> void:
	if viewport.get_child_count() > 0:
		viewport.remove_child(gen)
	gen = generators[index].new()
	sidebar._fill_options()

func set_viewer_texture() -> void:
	viewport.add_child(gen)
	gen.update()
	
	var itex = ImageTexture.new()
	yield(VisualServer, "frame_post_draw")
	var img = viewport.get_texture().get_data()
	itex.create_from_image(img)
	
	viewer.set_texture(itex)
	yield(VisualServer, "frame_post_draw")
	viewport.remove_child(gen)
	
func randomize_parameters() -> void:
	for param in gen.parameters:
		# If param is inside the locked array, then don't randomize
		if not gen.locked.has(param):
			match typeof(gen.parameters[param][0]):
					TYPE_BOOL:
						gen.parameters[param][0] = bool(int(randf()))
					TYPE_INT, TYPE_REAL:
						gen.parameters[param][0] = rand_range(gen.parameters[param][1], gen.parameters[param][2])
					TYPE_STRING:
						pass # Why would you randomize a string?!?!
					TYPE_COLOR:
						gen.parameters[param][0] = Color(randf(), randf(), randf())
						
func toggle_lock_parameter(param:String) -> void:
	if gen.locked.has(param):
		gen.locked.erase(param)
	else:
		gen.locked.append(param)
