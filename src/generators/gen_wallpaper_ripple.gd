extends Generator


var metadata:Dictionary = {
	"name": "Ripple Wallpaper Generator",
	"description": "Generate minimalist circle ripple effect wallpapers",
	"version": "0.1",
	"author": "qewer33",
	"thumbnail": "",
	"category": "wallpaper",
}

var parameters:Dictionary = {
	"width": IntProperty.new(1280, 200, 1900, 1),
	"height": IntProperty.new(720, 200, 1080, 1),
	"bg_color": ColorProperty.new(Color8(255, 255, 255)),
	"fg_color": ColorProperty.new(Color8(200, 200, 200)),
	"offset_x": IntProperty.new(0, -9999, 9999, 1),
	"offset_y": IntProperty.new(0, -9999, 9999, 1),
	"main_circle_size": IntProperty.new(100, 10, 500, 1),
	"ripple_count": IntProperty.new(5, 2, 15, 1),
	"ripple_spacing": IntProperty.new(10, 3, 100, 1),
	"spacing_difference": FloatProperty.new(0.2, 0, 1.0, 0.1),
	"ripple_alpha": FloatProperty.new(0.15, 0.05, 0.5, 0.05),
}

var locked:Array = [
	"width",
	"height",
	"offset_x",
	"offset_y",
]


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)
	
	draw_rect(Rect2(0, 0, parameters["width"].value, parameters["height"].value), parameters["bg_color"].value, true)
	
	for i in range(parameters["ripple_count"].value):
		var color = parameters["fg_color"].value
		color.a = parameters["ripple_alpha"].value
		draw_circle(
			Vector2(
				parameters["width"].value/2 + parameters["offset_x"].value, 
				parameters["height"].value/2 + parameters["offset_y"].value
			),
			parameters["main_circle_size"].value + parameters["ripple_spacing"].value * i/2 + parameters["ripple_spacing"].value * i * (i*parameters["spacing_difference"].value)/2,
			color
		)
	
	draw_circle(
		Vector2(
			parameters["width"].value/2 + parameters["offset_x"].value, 
			parameters["height"].value/2 + parameters["offset_y"].value
		),
		parameters["main_circle_size"].value,
		parameters["fg_color"].value
	)
