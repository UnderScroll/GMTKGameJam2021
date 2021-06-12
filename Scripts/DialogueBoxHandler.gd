extends RichTextLabel


var texte = "Vous savez, c'est pas [url=01][color=red]facile[/color][/url] tous les jours. [url=02][color=red]La programmation[/color][/url] ça me casse les pieds à un point vous pouvez pas savoir."
var longueur
var truetexte
var couleur
var indice
signal word_clicked

func _ready():
	longueur=0
	couleur=false
	indice=0
	connect("meta_clicked", self, "_click")

	
func _dialogue(dialog_texte) :
	text=dialog_texte
	longueur=0
	couleur=false
	indice=0


func _process(delta):
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
	if texte.length()>longueur+1 :
		longueur+=1

func _click(mot) :
	emit_signal("word_clicked",mot)
	pass
