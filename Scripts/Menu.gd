extends Node2D


func _ready():
	pass # Replace with function body.


func _on_StartButton_pressed():
	self.visible = false
	get_node("/root/MainScene/Tutorial").visible = true


func _on_QuitButton_pressed():
	get_tree().quit()
