extends Node2D
var node0
var node1
var score = -10

func doesExist():
	pass

func ready():
	score = -10

func _process(delta):
	if (node0 != null):
		get_node("Line2D").set_point_position(0,node0.position)
	if (node1 != null):
		get_node("Line2D").set_point_position(1,node1.position)
	if (score == -10 and node0 != null and node1 != null):
		var ScoreNode = get_node("/root/MainScene/Score")
		if (ScoreNode.joins.has([node0.id,node1.id])):
			score = ScoreNode.joins.get([node0.id,node1.id])
			get_node("/root/MainScene/Score").joins_done.append([node0.id,node1.id])
		elif (ScoreNode.joins.has([node1.id,node0.id])):
			score = ScoreNode.joins.get([node1.id,node0.id])
			get_node("/root/MainScene/Score").joins_done.append([node1.id,node0.id])
		else:
			score = 0
		get_parent().updateScore()
