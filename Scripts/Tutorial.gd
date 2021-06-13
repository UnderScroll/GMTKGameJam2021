extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_SkipButton_pressed():
	self.visible = false
	get_node("/root/MainScene/Map").visible = true
