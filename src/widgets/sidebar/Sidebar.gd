extends Control


onready var loader:Node = get_parent().find_node("Loader")
onready var viewer:Panel = get_parent().find_node("Viewer")
onready var viewport:Viewport = viewer.viewport
onready var file_dialog:FileDialog = get_parent().find_node("FileDialog")

onready var anim_player: = $AnimationPlayer
onready var close_button: = find_node("CloseButton")
onready var option_button: = find_node("GeneratorOptionButton")
onready var options_vbox: = find_node("OptionsVBox")

onready var menu_icon: = ResourceLoader.load("res://assets/icons/white/icon_menu.svg")
onready var close_icon: = ResourceLoader.load("res://assets/icons/white/icon_close.svg")
onready var option_input: = ResourceLoader.load("res://src/widgets/option_input/OptionInput.tscn")

var open:bool = true

var option_inputs:Array = []


func _ready() -> void:
	rect_size.x = 350
	_fill_generators()
	
func _process(delta: float) -> void:
	rect_size.y = get_viewport_rect().size.y
	
func open() -> void:
	anim_player.play_backwards("slide")
	open = true
	close_button.icon = close_icon
	
func close() -> void:
	anim_player.play("slide")
	open = false
	close_button.icon = menu_icon
	
func _fill_generators() -> void:
	for gen in loader.generators:
		var instance = gen.new()
		option_button.add_item(instance.metadata["name"])
		
func _fill_options() -> void:
	# delete all children of OptionsVBox
	for child in options_vbox.get_children():
		child.queue_free()
	
	# reset option_inputs
	option_inputs = []
	
	# create new OptionInput for each parameter
	var parameters = loader.gen.parameters
	for param in parameters:
		
		option_inputs.append(option_input.instance())
		
		var input = option_inputs[option_inputs.size()-1]
		
		var fparam = param.replace("*", "").capitalize()
		input.set_label(fparam)
		options_vbox.add_child(input)
		
		input.lock_button.pressed = loader.gen.locked.has(param)
		input.lock_button.connect("pressed", loader, "toggle_lock_parameter", [param])
		
		input.set_type(parameters[param])

func set_parameters() -> void:
	for i in range(loader.gen.parameters.size()):
		var keys = loader.gen.parameters.keys()
		loader.gen.parameters[keys[i]][0] = option_inputs[i].get_active_value()


func _on_CloseButton_pressed() -> void:
	if open:
		close()
	else:
		open()

func _on_GenerateButton_pressed() -> void:
	set_parameters()
	loader.set_viewer_texture()
	
func _on_RandomizeButton_pressed() -> void:
	set_parameters()
	loader.randomize_parameters()
	_fill_options()
	_on_GenerateButton_pressed() 
	
func _on_SaveButton_pressed() -> void:
	file_dialog.popup_centered()
	
func _on_GeneratorOptionButton_item_selected(index: int) -> void:
	loader.change_generator(index)
