extends Generator


var metadata:Dictionary = {
	"name": "Line Grid Generator",
	"description": "Generate line grid patterns",
	"version": "0.1",
	"author": "qewer33",
	"thumbnail": "",
	"category": "grid",
}

var parameters:Dictionary = {
	"width": IntProperty.new(1280, 200, 1900, 1),
	"height": IntProperty.new(720, 200, 1080, 1),
	"bg_color": ColorProperty.new(Color8(255, 255, 255)),
	"fg_color": ColorProperty.new(Color8(200, 200, 200)),
	"line_width": IntProperty.new(1, 1, 50, 1),
	"mainline_width": IntProperty.new(2, 1, 50, 1),
	"spacing_x": IntProperty.new(20, 1, 500, 5),
	"spacing_y": IntProperty.new(20, 1, 500, 5),
	"mainline_every": IntProperty.new(5, 2, 100, 1),
}

var locked:Array = [
	"width",
	"height",
]


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)

	draw_rect(Rect2(0, 0, parameters["width"].value, parameters["height"].value), parameters["bg_color"].value, true)
	
	for x in range(parameters["width"].value/parameters["spacing_x"].value+1):
		draw_rect(
			Rect2(x*parameters["spacing_x"].value, 0, parameters["line_width"].value, parameters["height"].value), 
			parameters["fg_color"].value, 
			true
		)
		
		if x % int(parameters["mainline_every"].value) == 0:
			draw_rect(
				Rect2(x*parameters["spacing_x"].value, 0, parameters["mainline_width"].value, parameters["height"].value), 
				parameters["fg_color"].value, 
				true
			)
			
		for y in range(parameters["height"].value/parameters["spacing_y"].value+1):
			draw_rect(
				Rect2(0, y*parameters["spacing_y"].value, parameters["width"].value, parameters["line_width"].value), 
				parameters["fg_color"].value, 
				true
			)
			
			if y % int(parameters["mainline_every"].value) == 0:
				draw_rect(Rect2(0, y*parameters["spacing_y"].value, parameters["width"].value, parameters["mainline_width"].value), 
				parameters["fg_color"].value, 
				true
			)
