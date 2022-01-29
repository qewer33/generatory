extends Button
class_name DualStateButton
# TODO: This current implementation for this button isn't any good
# but works for now, can be improved later

var state:bool = true
export var state_one_icon:Texture
export var state_one_text:String
export var state_two_icon:Texture
export var state_two_text:String
export var toggle:bool


func _ready() -> void:
	toggle_mode = toggle
	
	if toggle:
		state = pressed
		
	if state:
		icon = state_one_icon
		text = state_one_text
	else:
		icon = state_two_icon
		text = state_two_text


func _on_LockButton_pressed() -> void:
	if state:
		icon = state_two_icon
		text = state_two_text
		state = false
	else:
		icon = state_one_icon
		text = state_one_text
		state = true
