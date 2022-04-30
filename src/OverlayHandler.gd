extends Node


onready var viewer:Panel = get_parent().find_node("Viewer")
onready var viewport:Viewport = viewer.viewport
onready var sidebar:HBoxContainer = get_parent().find_node("Sidebar")
onready var viewport_group:Node = viewport.get_node("Overlays")

var overlays:Array = [
	
]

var active_overlays:Array = [
	
]


func _ready() -> void:
	pass
