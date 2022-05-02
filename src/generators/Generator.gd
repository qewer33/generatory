extends Node2D
class_name Generator


class IntProperty:
	const TYPE = Global.PropertyType.INT
	
	var value: int
	var min_value: int
	var max_value: int
	var value_increment: int
	
	func _init(val, min_val, max_val, val_increment) -> void:
		value = val
		min_value = min_val
		max_value = max_val
		value_increment = val_increment
		
class FloatProperty:
	const TYPE = Global.PropertyType.FLOAT
	
	var value: float
	var min_value: float
	var max_value: float
	var value_increment: float
	
	func _init(val, min_val, max_val, val_increment) -> void:
		value = val
		min_value = min_val
		max_value = max_val
		value_increment = val_increment
		
class BoolProperty:
	const TYPE = Global.PropertyType.BOOL
	
	var value: bool
	
	func _init(val) -> void:
		value = val
		
class ColorProperty:
	const TYPE = Global.PropertyType.COLOR
	
	var value: Color
	
	func _init(val) -> void:
		value = val
		
class StringProperty:
	const TYPE = Global.PropertyType.STRING
	
	var value: String
	
	func _init(val) -> void:
		value = val


func get_out() -> Texture:
	return get_parent().get_texture()
