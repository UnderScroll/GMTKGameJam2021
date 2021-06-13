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
	for child in self.get_children():
		if child.has_method("degage") and child != fragment:
			if id == child.get_node("KinematicBody2D").id:
				fragment.queue_free()

func setJoin(var fragment):
	if joinCount < 5:
		if (!creating_join):
			print("join one")
			var scene = load("res://Objects/Join.tscn")
			var join = scene.instance()
			current_join = join
			creating_join = true
			join.get_node("Line2D").set_point_position(0,fragment.position)
			join.node0 = fragment
			join.hide()
			add_child(join)
		else:
			creating_join = false
			var alreadyExists = false
			if (fragment != current_join.node0):
				print("Current Join : ",current_join.node0,current_join.node1)
				for child in self.get_children():
					if child.has_method("doesExist"): 
						print("Child : ",child.node0,child.node1)
						if ((child.node0 == current_join.node0 and child.node1 == fragment) or (child.node1 == current_join.node0 and child.node0 == fragment)) and child.node1 != null:
							print("Already exists")
							current_join.queue_free()
							alreadyExists = true
							joinCount -= 1
							break
				joinCount += 1
				current_join.node1 = fragment
				current_join.show()
			else:
				print("Self Join")
				current_join.queue_free()
	$JoinLeft.text = String(4-joinCount)
				

func _on_Reset_Join_pressed():
	var joinsList = get_node("/root/MainScene/Score").joins_done
	for child in self.get_children():
		if child.has_method("doesExist"):
			var joinIndex = joinsList.find([child.node0.id,child.node1.id])
			if (joinIndex != -1):
				joinsList.remove(joinIndex)
			child.queue_free()
	joinCount = 0
	$JoinLeft.text = String(4-joinCount)
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

func checkCollision(var frag, var pos):
	for child in self.get_children():
		if child.has_method("degage") and child.get_node("KinematicBody2D").position != frag.position:
			var frag2 = child.get_node("KinematicBody2D")
			print(frag.position,frag2.position)
			if abs(frag.position.x - frag2.position.x) < 82 and abs(frag.position.y - frag2.position.y) < 45:
				print("trop pres")
				frag.position = pos
				break
