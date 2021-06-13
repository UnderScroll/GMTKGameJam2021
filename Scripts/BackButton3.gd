extends Node

var idnumber=2

func _on_BackButton_pressed():
	self.visible = false
	get_node("/root/MainScene/Map").visible = true
