extends Generator


var metadata:Dictionary = {
	"name": "Stripes Wallpaper Generator",
	"description": "Generate angled stripes wallpapers",
	"version": "0.1",
	"author": "qewer33",
	"thumbnail": "",
	"category": "wallpaper",
}

var parameters:Dictionary = {
	"width": IntProperty.new(1280, 200, 1900, 1),
	"height": IntProperty.new(720, 200, 1080, 1),
	"fg_color": ColorProperty.new(Color8(160, 110, 210)),
	"stripe_width": IntProperty.new(100, 10, 500, 1),
	"stripe_angle": IntProperty.new(45, 0, 45, 1),
	"lighten_value": FloatProperty.new(0.1, 0, 1, 0.1),
}

var locked:Array = [
	"width",
	"height",
]


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)
	
	var angled_height:float = parameters["height"].value * range_lerp(parameters["stripe_angle"].value, 0, 45, 0, 1)
	
	for i in range((parameters["width"].value + angled_height)/parameters["stripe_width"].value + 1):
		if i % 2 == 0:
			draw_colored_polygon(
				PoolVector2Array([
					Vector2(i*parameters["stripe_width"].value, 0),
					Vector2(i*parameters["stripe_width"].value + parameters["stripe_width"].value, 0),
					Vector2(i*parameters["stripe_width"].value + parameters["stripe_width"].value - angled_height, parameters["height"].value),
					Vector2(i*parameters["stripe_width"].value - angled_height, parameters["height"].value)
				]),
				parameters["fg_color"].value
			)
		else:
			draw_colored_polygon(
				PoolVector2Array([
					Vector2(i*parameters["stripe_width"].value, 0),
					Vector2(i*parameters["stripe_width"].value + parameters["stripe_width"].value, 0),
					Vector2(i*parameters["stripe_width"].value + parameters["stripe_width"].value - angled_height, parameters["height"].value),
					Vector2(i*parameters["stripe_width"].value - angled_height, parameters["height"].value)
				]),
				parameters["fg_color"].value.lightened(parameters["lighten_value"].value)
			)
