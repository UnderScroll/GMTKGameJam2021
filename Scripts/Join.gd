extends Node2D
var node0
var node1

func doesExist():
	pass

func _process(delta):
	if (node0 != null):
		get_node("Line2D").set_point_position(0,node0.position)
	if (node1 != null):
		get_node("Line2D").set_point_position(1,node1.position)
