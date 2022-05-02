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
	
func set_type(param) -> void:
	match param.TYPE:
			Global.PropertyType.BOOL:
				type = 0
			Global.PropertyType.INT, Global.PropertyType.FLOAT:
				type = 1
				inputs[type].min_value = param.min_value
				inputs[type].max_value = param.max_value
				inputs[type].step = param.value_increment
				inputs[type].value = param.value
			Global.PropertyType.STRING:
				type = 2
			Global.PropertyType.COLOR:
				type = 3
				inputs[type].color = param.value
				
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
