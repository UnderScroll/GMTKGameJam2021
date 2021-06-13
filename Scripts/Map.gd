extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Character1_pressed():
	self.visible = false
	get_node("/root/MainScene/Character1").visible = true


func _on_Character2_pressed():
	self.visible = false
	get_node("/root/MainScene/Character2").visible = true


func _on_Character3_pressed():
	self.visible = false
	get_node("/root/MainScene/Character3").visible = true
