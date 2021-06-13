extends Node2D

var joinCount = 0
var creating_join = false
var current_join
var graphScore = 0

func _ready():
	graphScore = 0

func _on_Button_pressed():
	var scene = load("res://Objects/Fragment.tscn")
	var fragment = scene.instance()
	add_child(fragment)

func addFragment(var id):
	var scene = load("res://Objects/Fragment.tscn")
	var fragment = scene.instance()
	add_child(fragment)
	fragment.get_node("KinematicBody2D").id = id
	var labelNode = fragment.get_node("KinematicBody2D/NinePatchRect").get_node("Label")
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
		else:
			if (fragment != current_join.node0):
				current_join.node1 = fragment
				for child in self.get_children():
					if child.has_method("doesExist"): 
						if !(current_join.node0 == child.node1 and current_join.node1 == child.node1) or (current_join.node0 == child.node1 and current_join.node1 == child.node0):
							creating_join = !creating_join
							current_join.get_node("Line2D").set_point_position(1,fragment.position)
							current_join.show()
							joinCount += 1
						else:
							print("Already exists")
							current_join.queue_free()
			else:
				print("Self Join")
				current_join.queue_free()
				

func _on_Reset_Join_pressed():
	var joinsList = get_node("/root/MainScene/Score").joins_done
	for child in self.get_children():
		if child.has_method("doesExist"):
			var joinIndex = joinsList.find([child.node0.id,child.node1.id])
			if (joinIndex != -1):
				joinsList.remove(joinIndex)
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

func _hard_reset():
	for child in self.get_children():
		if child.has_method("doesExist"):
			child.queue_free()
		if child.has_method("degage"):
			print("Bobesquifique")
			child.queue_free()
	joinCount = 0
	current_join = null
	creating_join = false
	graphScore = 0
