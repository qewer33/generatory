extends Control


onready var viewer: = $Viewer
onready var sidebar: = $Sidebar
onready var about_dialog: = $AboutDialog


func _ready() -> void:
	about_dialog.popup_centered()


func _on_InfoButton_pressed() -> void:
	about_dialog.popup_centered()

func _on_FileDialog_file_selected(path: String) -> void:
	pass # Replace with function body.
