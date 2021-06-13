extends TextureRect



func _ready():
	hide()


func _on_Label_texte_fini():
	show()


func _on_Label_texte_started():
	hide()
