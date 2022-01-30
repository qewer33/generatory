extends Button
class_name DualStateButton
# TODO: This current implementation for this button isn't any good
# but works for now, can be improved later

signal state_changed

var state:bool = true
export var state_one_icon:Texture
export var state_one_text:String
export var state_two_icon:Texture
export var state_two_text:String


func _ready() -> void:
	connect("state_changed", self, "on_self_state_changed")
	
	icon = state_one_icon
	text = state_one_text

func set_state(new_state:bool) -> void:
	state = new_state
	emit_signal("state_changed")
	
func on_self_state_changed() -> void:
	if state:
		icon = state_two_icon
		text = state_two_text
		state = false
	else:
		icon = state_one_icon
		text = state_one_text
		state = true


func _on_LockButton_pressed() -> void:
	set_state(pressed)
