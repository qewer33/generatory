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
	"width": IntProperty.new(1280, 200, 1900, 1),
	"height": IntProperty.new(720, 200, 1080, 1),
	"lacunarity": FloatProperty.new(2.0, 0, 5.0, 0.1),
	"octaves": FloatProperty.new(3, 0, 8, 1),
	"period": IntProperty.new(64.0, 0, 128.0, 1),
	"persistence": FloatProperty.new(0.5, 0, 1.0, 0.1),
	"texture_modulate": ColorProperty.new(Color8(255, 255, 255)),
}

var locked:Array = [
	"width",
	"height",
]

var texture: = NoiseTexture.new()
var noise: = OpenSimplexNoise.new()


func _ready() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)

func _draw() -> void:
	get_parent().size = Vector2(parameters["width"].value, parameters["height"].value)
	
	noise.seed = randi()
	noise.lacunarity = parameters["lacunarity"].value
	noise.octaves = parameters["octaves"].value
	noise.period = parameters["period"].value
	noise.persistence = parameters["persistence"].value
	
	texture.noise = noise
	texture.width =  parameters["width"].value
	texture.height =  parameters["height"].value
	
	draw_texture_rect(
		texture,
		Rect2(0, 0, parameters["width"].value, parameters["height"].value),
		false,
		parameters["texture_modulate"].value
	)
