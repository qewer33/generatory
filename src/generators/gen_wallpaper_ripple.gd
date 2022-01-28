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
	"width": [1280, 200, 1900, 1],
	"height": [720, 200, 1080, 1],
	"bg_color": [Color8(255, 255, 255)],
	"fg_color": [Color8(200, 200, 200)],
	"offset_x": [0, -9999, 9999, 1],
	"offset_y": [0, -9999, 9999, 1],
	"main_circle_size": [100, 10, 500, 1],
	"ripple_count": [5, 2, 15, 1],
	"ripple_spacing": [10, 3, 100, 1],
	"spacing_difference": [0.2, 0, 1.0, 0.1],
	"ripple_alpha": [0.15, 0.05, 0.5, 0.05],
}

var locked:Array = [
	"width",
	"height",
	"offset_x",
	"offset_y",
]


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])
	
	draw_rect(Rect2(0, 0, parameters["width"][0], parameters["height"][0]), parameters["bg_color"][0], true)
	
	for i in range(parameters["ripple_count"][0]):
		var color = parameters["fg_color"][0]
		color.a = parameters["ripple_alpha"][0]
		draw_circle(
			Vector2(
				parameters["width"][0]/2 + parameters["offset_x"][0], 
				parameters["height"][0]/2 + parameters["offset_y"][0]
			),
			parameters["main_circle_size"][0] + parameters["ripple_spacing"][0]*i/2 + parameters["ripple_spacing"][0]*i*(i*parameters["spacing_difference"][0])/2,
			color
		)
	
	draw_circle(
		Vector2(
			parameters["width"][0]/2 + parameters["offset_x"][0], 
			parameters["height"][0]/2 + parameters["offset_y"][0]
		),
		parameters["main_circle_size"][0],
		parameters["fg_color"][0]
	)
