extends Node2D

var joinCount = 0
var creating_join = false
var current_join
var graphScore = 0

func _ready():
	graphScore = 0
	addFragment(0)
	addFragment(1)

func _on_Button_pressed():
	var scene = load("res://Objects/Fragment.tscn")
	var fragment = scene.instance()
	add_child(fragment)

func addFragment(var id):
	var scene = load("res://Objects/Fragment.tscn")
	var fragment = scene.instance()
	add_child(fragment)
	fragment.get_node("KinematicBody2D").id = id
	var labelNode = fragment.get_node("KinematicBody2D").get_node("Label")
	labelNode.text = get_node("/root/MainScene/Score").fragments[id]

func setJoin(var fragment):
	if joinCount < 5:
		if (!creating_join):
			print("join one")
			var scene = load("res://Objects/Join.tscn")
			var join = scene.instance()
			current_join = join
			creating_join = !creating_join
			join.get_node("Line2D").set_point_position(0,fragment.position)
			join.node0 = fragment
			join.hide()
			add_child(join)
			joinCount += 1
		else:
			creating_join = !creating_join
			current_join.get_node("Line2D").set_point_position(1,fragment.position)
			current_join.node1 = fragment
			current_join.show()

func _on_Reset_Join_pressed():
	for child in self.get_children():
		if child.has_method("doesExist"):
			child.queue_free()
	joinCount = 0
	current_join = null
	creating_join = false
	graphScore = 0

func updateScore():
	graphScore = 0
	print("graphScore")
	for child in self.get_children():
		if child.has_method("doesExist"):
			graphScore += child.score
	print(graphScore)
