extends AudioStreamPlayer2D

func _ready() :
	playing=true

func _on_TextureButton_toggled(button_pressed):
	playing=not playing
