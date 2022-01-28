extends Panel


onready var viewport:Viewport = find_node("Viewport")
onready var texture_rect:TextureRect = find_node("TextureRect")

var zoom:float = 1
var zoom_delta:float = 0.05;
var min_zoom:float = 0.2
var max_zoom:float = 2.5

func _ready() -> void:
	set_zoom(1)
	
func _process(delta: float) -> void:
	_zoom()
	
func _zoom() -> void:
	if Input.is_action_pressed("zoom_modifier"):
		if Input.is_action_just_released("scroll_up"):
			set_zoom(zoom + zoom_delta)
		if Input.is_action_just_released("scroll_down"):
			set_zoom(zoom - zoom_delta)

func set_zoom(new_zoom:float) -> void:
	zoom = new_zoom
	texture_rect.rect_min_size = viewport.size * zoom
	
func set_texture(texture:Texture) -> void:
	texture_rect.texture = texture


func _on_Viewport_size_changed() -> void:
	set_zoom(1)
