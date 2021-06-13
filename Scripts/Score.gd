extends Node2D

var score

var fragments = {
	1 : "Her",
	2 : "Dark room",
	3 : "Flower",
	4 : "Best friends",
	5 : "Park",
	6 : "Dinner",
	7 : "Health",
	8 : "Charles",
	9 : "Retirement",
	10 : "Home",
	11 : "Grandpa",
	12 : "Money",
	13 : "Park",
}

var joins = {
	[4,5] : 10,
	[1,3] : 20,
	[3,5] : 10,
	[1,4] : 10,
	[6,8] : 0,
	[1,6] : 0,
	[1,8] : 5,
	[1,9] : 10,
	[1,7] : 20,
	[7,8] : -5,
	[8,9] : 0,
	[7,9] : 10,
	[1,11] : 10,
	[1,13] : 20,
	[11,13] : -5,
	[10,11] : 15,
	[1,10] : 5,
	[11,12] : 0
}

var joins_done = []

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
