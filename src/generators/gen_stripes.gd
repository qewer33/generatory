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
	"width": [1280, 200, 1900, 1],
	"height": [720, 200, 1080, 1],
	"fg_color": [Color8(160, 110, 210)],
	"stripe_width": [100, 10, 500, 1],
	"stripe_angle": [45, 0, 45, 1],
	"lighten_value": [0.1, 0, 1, 0.1],
}

var locked:Array = [
	"width",
	"height",
]


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])
	
	var angled_height:float = parameters["height"][0]*range_lerp(parameters["stripe_angle"][0], 0, 45, 0, 1)
	
	for i in range((parameters["width"][0]+angled_height)/parameters["stripe_width"][0] + 1):
		if i % 2 == 0:
			draw_colored_polygon(
				PoolVector2Array([
					Vector2(i*parameters["stripe_width"][0], 0),
					Vector2(i*parameters["stripe_width"][0]+parameters["stripe_width"][0], 0),
					Vector2(i*parameters["stripe_width"][0]+parameters["stripe_width"][0] - angled_height, parameters["height"][0]),
					Vector2(i*parameters["stripe_width"][0] - angled_height, parameters["height"][0])
				]),
				parameters["fg_color"][0]
			)
		else:
			draw_colored_polygon(
				PoolVector2Array([
					Vector2(i*parameters["stripe_width"][0], 0),
					Vector2(i*parameters["stripe_width"][0]+parameters["stripe_width"][0], 0),
					Vector2(i*parameters["stripe_width"][0]+parameters["stripe_width"][0] - angled_height, parameters["height"][0]),
					Vector2(i*parameters["stripe_width"][0] - angled_height, parameters["height"][0])
				]),
				parameters["fg_color"][0].lightened(parameters["lighten_value"][0])
			)
