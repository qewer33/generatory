extends Generator


var metadata:Dictionary = {
	"name": "Simplex Noise Generator",
	"description": "Generate a 2d noise image based on Open Simplex Noise",
	"version": "0.1",
	"author": "qewer33",
	"thumbnail": "",
	"category": "utility",
}

var parameters:Dictionary = {
	"width": [1280, 200, 1900, 1],
	"height": [720, 200, 1080, 1],
	"lacunarity": [2.0, 0, 5.0, 0.1],
	"octaves": [3, 0, 8, 1],
	"period": [64.0, 0, 128.0, 1],
	"persistence": [0.5, 0, 1.0, 0.1],
	"texture_modulate": [Color8(255, 255, 255)],
}

var locked:Array = [
	"width",
	"height",
]

var texture: = NoiseTexture.new()
var noise: = OpenSimplexNoise.new()


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"][0], parameters["height"][0])
	
	noise.seed = randi()
	noise.lacunarity = parameters["lacunarity"][0]
	noise.octaves = parameters["octaves"][0]
	noise.period = parameters["period"][0]
	noise.persistence = parameters["persistence"][0]
	
	texture.noise = noise
	texture.width =  parameters["width"][0]
	texture.height =  parameters["height"][0]
	
	draw_texture_rect(
		texture,
		Rect2(0, 0, parameters["width"][0], parameters["height"][0]),
		false,
		parameters["texture_modulate"][0]
	)
