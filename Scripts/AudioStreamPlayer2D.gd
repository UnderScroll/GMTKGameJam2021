extends AudioStreamPlayer2D

func _ready() :
	playing=true

func _on_SoundToggle_pressed():
	playing=not playing
