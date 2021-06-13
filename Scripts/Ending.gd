extends Node2D

func _ready():
	pass # Replace with function body.
	

func _on_Restart_pressed():
	self.visible = false
	get_node("/root/MainScene/Menu").visible = true
	var graph1 = get_node("/root/MainScene/Character1/Graph")
	var graph2 = get_node("/root/MainScene/Character2/Graph")
	var graph3 = get_node("/root/MainScene/Character3/Graph")
	graph1._hard_reset()
	graph2._hard_reset()
	graph3._hard_reset()

func processEnd():
	print(get_parent().get_node("Score").joins_done)
