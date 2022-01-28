extends HBoxContainer


onready var lock_button: = $LockButton

var type:int = 0

onready var inputs:Array = [
	$Bool,
	$Int,
	$String,
	$Color,
]


func _ready() -> void:
	pass
	
func set_label(text:String) -> void:
	$Label.text = text
	
func set_type(param:Array) -> void:
	match typeof(param[0]):
			TYPE_BOOL:
				type = 0
			TYPE_INT, TYPE_REAL:
				type = 1
				inputs[type].min_value = param[1]
				inputs[type].max_value = param[2]
				inputs[type].step = param[3]
				inputs[type].value = param[0]
			TYPE_STRING:
				type = 2
			TYPE_COLOR:
				type = 3
				inputs[type].color = param[0]
				
	inputs[type].visible = true

func get_active_value():
	match type:
			0:
				return inputs[type].pressed
			1:
				return inputs[type].value
			2:
				return inputs[type].text
			3:
				return inputs[type].color
