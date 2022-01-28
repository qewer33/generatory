extends Button


func _process(delta: float) -> void:
	if pressed:
		icon = load("res://assets/icons/white/icon_locked.svg")
	else:
		icon = load("res://assets/icons/white/icon_unlocked.svg")
