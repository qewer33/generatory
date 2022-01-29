extends AcceptDialog


onready var license_button = find_node("LicenseButton")
onready var license_field = find_node("LicenseField")

var initial_size:Vector2


func _ready() -> void:
	initial_size = rect_size

func _on_LicenseButton_pressed() -> void:
	if license_button.pressed:
		license_field.visible = true
		rect_size.y = initial_size.y + license_field.rect_size.y
		rect_global_position.y -= license_field.rect_size.y/2
	else:
		license_field.visible = false
		rect_size = initial_size
		rect_global_position.y += license_field.rect_size.y/2
