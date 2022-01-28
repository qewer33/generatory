extends Generator


var metadata:Dictionary = {
	"name": "Dot Grid Generator",
	"description": "Generate dot grid patterns",
	"version": "0.1",
	"author": "qewer33",
	"thumbnail": "",
	"category": "grid",
}

var parameters:Dictionary = {
	"width": [1280, 200, 1900, 1],
	"height": [720, 200, 1080, 1],
	"bg_color": [Color8(255, 255, 255)],
	"fg_color": [Color8(200, 200, 200)],
	"dot_width": [1, 1, 50, 1],
	"maindot_width": [2, 1, 50, 1],
	"spacing_x": [20, 1, 500, 5],
	"spacing_y": [20, 1, 500, 5],
	"maindot_every": [5, 2, 100, 1],
}

var locked:Array = [
	"width",
	"height",
]


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])
	
	draw_rect(Rect2(0, 0, parameters["width"][0], parameters["height"][0]), parameters["bg_color"][0], true)
	
	for x in range(parameters["width"][0]/parameters["spacing_x"][0]+1):
		for y in range(parameters["height"][0]/parameters["spacing_y"][0]+1):
			draw_circle(Vector2(x*parameters["spacing_x"][0], y*parameters["spacing_y"][0]), parameters["dot_width"][0], parameters["fg_color"][0])
			
			if x % int(parameters["maindot_every"][0]) == 0 or y % int(parameters["maindot_every"][0]) == 0:
				draw_circle(Vector2(x*parameters["spacing_x"][0], y*parameters["spacing_y"][0]), parameters["maindot_width"][0], parameters["fg_color"][0])
