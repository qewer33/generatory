extends Button
class_name DualStateButton
# TODO: improve DualStateButton implementation later

signal state_changed

var state:int = 0
export var state_one_icon: Texture
export var state_one_text: String
export var state_two_icon: Texture
export var state_two_text: String


func _ready() -> void:
	connect("state_changed", self, "on_self_state_changed")
	
	icon = state_one_icon
	text = state_one_text

func set_state(new_state: int) -> void:
	state = new_state
	yield(get_tree(), "idle_frame")
	emit_signal("state_changed")
	
func on_self_state_changed() -> void:
	if state == 0:
		icon = state_two_icon
		text = state_two_text
		state = 1
	else:
		icon = state_one_icon
		text = state_one_text
		state = 0


func _on_LockButton_pressed() -> void:
	set_state(int(pressed))
