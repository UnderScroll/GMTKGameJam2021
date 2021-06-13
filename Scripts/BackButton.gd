extends Node

func _on_BackButton_pressed():
	self.visible = false
	get_node("/root/MainScene/Map").visible = true
