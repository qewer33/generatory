extends Overlay


var metadata:Dictionary = {
	"name": "Rectangle",
	"description": "A simple overlay that adds a rectangle on top of the generated image",
	"version": "0.1",
	"author": "qewer33",
	"thumbnail": "",
	"category": "basic",
}

var parameters:Dictionary = {
	"offset_x": [0, -9999, 9999, 1],
	"offset_y": [0, -9999, 9999, 1],
	"width": [200, 1, 9999, 1],
	"height": [200, 1, 9999, 1],
	"color": [Color8(255, 255, 255)],
	"filled": [true],
}


func _draw() -> void:
	draw_rect(
		Rect2(
			parameters["offset_x"], 
			parameters["offset_y"],
			parameters["width"], 
			parameters["height"]
		),
		parameters["color"],
		parameters["filled"],
		true
	)
