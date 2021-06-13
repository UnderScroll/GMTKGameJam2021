extends Node2D

signal processEnding


func _ready():
	connect("processEnding", get_node("/root/MainScene/Ending"), "processEnd")


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
	var LabelNode = character2.get_node("Character").get_node("NinePatchRect").get_node("Label")
	LabelNode.numerotexte = 0
	LabelNode._dialogue(LabelNode.listetexte[0])


func _on_Character3_pressed():
	self.visible = false
	var character3 = get_node("/root/MainScene/Character3")
	character3.visible = true
	var LabelNode = character3.get_node("Character").get_node("NinePatchRect").get_node("Label")
	LabelNode.numerotexte = 0
	LabelNode._dialogue(LabelNode.listetexte[0])


func _on_Remember_pressed():
	self.visible = false
	var endscreen = get_node("/root/MainScene/Ending")
	endscreen.visible = true
	emit_signal("processEnding")
