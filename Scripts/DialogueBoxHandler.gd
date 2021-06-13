extends RichTextLabel


var listetexte = [
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
# "Vous savez, c'est pas [url=01][color=red]facile[/color][/url] tous les jours. [url=02][color=red]La programmation[/color][/url] ça me casse les pieds à un point vous pouvez pas savoir."
var texte
var longueur
var truetexte
var couleur
var indice
var numerotexte
signal word_clicked
signal texte_fini
signal texte_started
var istextefini

func _ready():
	numerotexte=0
	_dialogue(listetexte[0])
	connect("meta_clicked", self, "_click")
	#connect("word_clicked",get_parent(), )

	
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


func _on_Timer_timeout():
	if not istextefini :
		if texte.length()>longueur+1 :
			longueur+=1
		else :
			if listetexte.size()>numerotexte+1 :
				emit_signal("texte_fini")
			istextefini=true

func _click(mot) :
	emit_signal("word_clicked",mot)


func _on_Arrow_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and istextefini :
			if listetexte.size()>numerotexte+1 :
				numerotexte+=1
				_dialogue(listetexte[numerotexte])
