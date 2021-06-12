extends Node2D

var joinCount = 0
var creating_join = false
var current_join
signal deleteJoin

func _ready():
	pass

func _on_Button_pressed():
	var scene = load("res://Fragment.tscn")
	var fragment = scene.instance()
	add_child(fragment)

func setJoin(var fragment):
	if joinCount < 5:
		if (!creating_join):
			print("join one")
			var scene = load("res://Join.tscn")
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
