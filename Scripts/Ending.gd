extends Node2D

var dico1={[4,5]:[
"The park is where we met the first time.",
"We used to go there all the time before she went to boarding school.",
"She loved playing in the park. I think she still came here regularly with her granddaughter."
],[3,5]:[
"She loved looking at flowers. She could stare at them for an hour without getting bored.",
"Those yellow ones were so lovely..."
],[1,3]:[
"Her name is also the name of a certain flower… which was it ?"
],[1,4]:[
"We loved to play outside whenever we had the chance. After school, after Mass…",
"I hated the clothes we were forced to wear then.",
"How were we supposed to climb trees with that ?"
]}

var dico2={[6,8]:[
"We had a rotisserie chicken that night. It was good, but we ate it in silence."
],[1,6]:[
"I think she liked the dinner."
],[1,8]:[
"We have been married for 59 years. Our 60th anniversary is in a few months.",
"I spent most of my life with her, and I don't regret it a bit."
],[1,9]:[
"We lived here for a few years now, but she never quite felt at home.",
"Before, we had our own home, with a huge garden… life was tranquil then.",
"But then, her state worsened, and we had to leave.",
"We sold our home and came here, to the dismay of our granddaughter."
],[1,7]:[
"…",
"She was sick… I saw her.",
"She slowly became… less. She is still the same person, but…",
"She is a husk of her former self, without any memories left."
],[7,8]:[
"I am doing just fine, personally. But there still is this lingering sadness…"
],[8,9]:[
"Even though I like it here, I still prefer our old home. Maybe it’s because I associate it with her being well…"
],[7,9]:[
"The nurses here are taking good care of her. I really hope she can get better but…",
"I can’t afford to indulge in such delusions."
]}

var dico3={[1,11]:[
"He really likes her. And she really likes him.",
"At least, when she remembers who he is."
],[1,13]:[
"I love playing in the park with her.",
"When she was younger, she often went to the park.",
"She even made a friend there.",
"I hope to go back with her someday."
],[11,13]:[
"Grandpa doesn’t like to go to the park.",
"I asked him multiple times to go there but he didn’t accept.",
"What a killjoy."
],[10,11]:[
"Grandpa really likes this home. I think it reminds him of grandma.",
"Or rather the time where she was doing well.",
"That’s why I want us to live here !"
],[1,10]:[
"She liked it here. It’s really calm in this part of town.",
"But right now, I don’t know if she can feel at home anywhere…",
"I’m gonna make it so that she can."
],[11,12]:[
"Who would have thought houses in the suburbs were so expensive !",
"I need to find a job soon to pay the mortgage.",
"In the end, all my efforts will be worth it."
]}

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
	$Conclusion.hide()
	$Conclusion2.hide()
	$Conclusion3.hide()
	var liens = get_parent().get_node("Score").joins_done
	var dialogue1=[]
	var dialogue2=[]
	var dialogue3=[]
	for i in dico1 :
		if i in liens :
			dialogue1+=dico1[i]
	for i in dico2 :
		if i in liens :
			dialogue2+=dico2[i]
	for i in dico3 :
		if i in liens :
			dialogue3+=dico3[i]
	dialogue1+=["yo"]
	dialogue2+=["yo"]
	dialogue3+=["yo"]
	var character1 = get_node("/root/MainScene/Character1")
	var LabelNode = character1.get_node("Character").get_node("NinePatchRect").get_node("Label")
	self.visible = false
	if dialogue1.size()>1 :
		character1.visible = true
		LabelNode.numerotexte=0
		LabelNode.listetexte=dialogue1
		LabelNode._dialogue(dialogue1[0])
		yield(LabelNode,"dialogue_fini")
		character1.visible = false
	if dialogue2.size()>1 :
		var character2 = get_node("/root/MainScene/Character3")
		character2.visible = true
		LabelNode = character2.get_node("Character").get_node("NinePatchRect").get_node("Label")
		LabelNode.numerotexte=0
		LabelNode.listetexte=dialogue2
		LabelNode._dialogue(dialogue2[0])
		yield(LabelNode,"dialogue_fini")
		character2.visible = false
	if dialogue3.size()>1 :
		var character3 = get_node("/root/MainScene/Character2")
		character3.visible = true
		LabelNode = character3.get_node("Character").get_node("NinePatchRect").get_node("Label")
		LabelNode.numerotexte=0
		LabelNode.listetexte=dialogue3
		LabelNode._dialogue(dialogue3[0])
		yield(LabelNode,"dialogue_fini")
		character3.visible = false
	self.visible=true
	var scorefinal = get_parent().get_node("Score").score
	if scorefinal<=40 :
		$Conclusion.show()
	elif scorefinal<=80 :
		$Conclusion2.show()
	else :
		$Conclusion3.show()
		
