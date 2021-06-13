extends Node2D

var score

var fragments = {
	0 : "Test0",
	1 : "Test1",
	2 : "Test2",
	3 : "Test3",
	4 : "Test4",
	5 : "Test5",
}

var joins = {
	[0,1] : 1,
	[1,3] : -1
}

var joins_done

func _ready():
	score = 0

func _process(_delta):
	updateScore()

func updateScore():
	score = 0
	var char1 = get_node("/root/MainScene/Character1")
	var char2 = get_node("/root/MainScene/Character2")
	var char3 = get_node("/root/MainScene/Character3")
	score += char1.get_node("Graph").graphScore
	score += char2.get_node("Graph").graphScore
	score += char3.get_node("Graph").graphScore
	for child in char1.get_children():
		if child.has_method("doesExist"):
			if child.node0 != null and child.node1:
					joins_done.append([child.node0,child.node1])
