extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Character1_pressed():
	self.visible = false
	var character1 = get_node("/root/MainScene/Character1")
	character1.visible = true
	var LabelNode = character1.get_node("Character").get_node("NinePatchRect").get_node("Label")
	LabelNode.numerotexte = 0
	LabelNode._dialogue(LabelNode.listetexte[0])
	


func _on_Character2_pressed():
	self.visible = false
	var character2 = get_node("/root/MainScene/Character2")
	character2.visible = true


func _on_Character3_pressed():
	self.visible = false
	var character3 = get_node("/root/MainScene/Character3")
	character3.visible = true
