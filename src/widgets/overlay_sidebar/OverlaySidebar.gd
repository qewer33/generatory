extends HBoxContainer


onready var handler:Node = get_parent().find_node("OverlayHandler")
onready var viewer:Panel = get_parent().find_node("Viewer")
onready var viewport:Viewport = viewer.viewport

onready var anim_player: = $AnimationPlayer
onready var close_button: = find_node("CloseButton")

onready var menu_icon: = ResourceLoader.load("res://assets/icons/white/icon_layers.svg")
onready var close_icon: = ResourceLoader.load("res://assets/icons/white/icon_close.svg")

var open:bool = false


func _ready() -> void:
	visible = true
	rect_size.x = 350
	rect_global_position.x = get_viewport_rect().size.x - 50
	get_viewport().connect("size_changed", self, "_on_Viewport_size_changed")

func _process(delta: float) -> void:
	rect_size.y = get_viewport_rect().size.y
	adjust_animation()
	
func adjust_animation() -> void:
	var anim:Animation = anim_player.get_animation("slide")
	anim.bezier_track_set_key_value(0, 1, get_viewport_rect().size.x - 50)
	anim.bezier_track_set_key_value(0, 0, get_viewport_rect().size.x - 350)
	
func open() -> void:
	anim_player.play_backwards("slide")
	open = true
	close_button.icon = close_icon
	
func close() -> void:
	anim_player.play("slide")
	open = false
	close_button.icon = menu_icon


func _on_CloseButton_pressed() -> void:
	if open:
		close()
	else:
		open()
		
func _on_Viewport_size_changed() -> void:
	if open:
		rect_global_position.x = get_viewport_rect().size.x - 350
	else:
		rect_global_position.x = get_viewport_rect().size.x - 50
