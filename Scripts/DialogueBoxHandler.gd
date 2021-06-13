extends RichTextLabel


var listetexte1 = [
"Hello. Are you still searching for [url=01][color=red]her[/color][/url] ?",
"…",
"I have a few memories of her, but there is one that’s more vivid than the others.",
"I was in a [url=02][color=red]dark room[/color][/url]. I don’t know where it was exactly, but she came near me.",
"'Do we know each other ?' She said.",
"It seemed our little [url=03][color=red]flower[/color][/url] lost some of her memories.",
"'We are [url=04][color=red]best friends[/color][/url], did you forget ?' I asked.",
"What I said made her freeze. She was so uneasy, she almost couldn’t move.",
"To break the tension, I asked her if she wanted to go to the [url=05][color=red]park[/color][/url] with me.",
"When she said yes, the room brightened up. I took her hand and we went to the park."
]
var listetexte3=[
"Even though we were very close, [url=01][color=red]she[/color][/url] would sometimes stay in her room, completely alone.",
"One day, she came to me after an entire week, and casually asked what was for [url=06][color=red]dinner[/color][/url].",
"She didn’t acknowledge anything else.",
"I was frustrated. I know it was because of her [url=07][color=red]health[/color][/url], but I still felt powerless.",
"\"Did you come just to torment me ?\" I asked. She didn’t understand.",
"\"After all this time without you, when we finally meet again, you forgot about me.\"",
"She was looking sad. All of this was wearing on her too.",
"\"I feel like I know you, but I can’t remember…\" she said timidly, on the brink of tears.",
"I walked to her and hugged her.",
"\"I’m your husband, [url=08][color=red]Charles[/color][/url]. We’re in our [url=09][color=red]retirement home[/color][/url].\""
]
var listetexte2=[
"\"[url=01][color=red]Grandma[/color][/url] ! I knew you would eventually get better.\"",
"\"Welcome home ! Your [url=10][color=red]true home[/color][/url] !\"",
"That’s what I will say when she comes back here.",
"I haven’t seen her in a while. She’s probably with [url=11][color=red]Grandpa[/color][/url] right now.",
"She needs rest. And I have things to do too !",
"I must work hard to get a degree and then a job.",
"After All, I need [url=12][color=red]money[/color][/url] to buy the house back.",
"The previous owners are talking about moving out, so I must act quickly !",
"I’m really fond of this house. I grew up here, and the [url=13][color=red]park[/color][/url] is just next door."
]
var listetexte
var texte
var longueur
var truetexte
var couleur
var indice
var numerotexte
signal word_clicked
signal texte_fini
signal dialogue_fini
signal texte_started
var istextefini

func _ready():
	listetexte = [listetexte1,listetexte2,listetexte3][get_parent().get_parent().get_parent().idnumber]
	numerotexte=0
	_dialogue(listetexte[0])
	connect("meta_clicked", self, "_click")
	connect("word_clicked",get_parent().get_parent().get_parent().get_node("Graph"), "addFragment")

	
func _dialogue(dialog_texte) :
	texte=dialog_texte
	longueur=0
	couleur=false
	indice=0
	emit_signal("texte_started")
	istextefini=false


func _process(_delta):
	if texte[longueur]=="[" and texte[longueur+1]=="u" :
		indice=longueur
		couleur=true
	if couleur :
		if texte[longueur+19]=="[" :
			couleur=false
			indice=0
			longueur+=32
		else :
			truetexte=texte.substr(0,indice)+"[color=red]"+texte.substr(indice+19,longueur-indice)+"[/color]"
	if not couleur :
		truetexte=texte.substr(0,longueur+1)
	set_bbcode(truetexte)
	if numerotexte==listetexte.size()-1 :
		emit_signal("dialogue_fini")


func _on_Timer_timeout():
	if not istextefini :
		if texte.length()>longueur+1 :
			longueur+=1
		else :
			if listetexte.size()>numerotexte+1 :
				emit_signal("texte_fini")
			istextefini=true

func _click(mot) :
	var id = int(mot)
	emit_signal("word_clicked",id)


func _on_Arrow_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and istextefini :
			if listetexte.size()>numerotexte+1 :
				numerotexte+=1
				_dialogue(listetexte[numerotexte])
				
