extends AudioStreamPlayer2D

func _ready() :
	playing=true

func _on_SoundToggle_toggled(button_pressed):
	playing=not playing
