extends KinematicBody2D

var dragging = false
var graph

signal dragsignal
signal clicksignal

func _ready():
	connect("dragsignal",self,"_on_dragsignal")
	graph = get_parent().get_parent()
	self.connect("clicksignal",graph,"setJoin")
	self.position.x = rand_range(20,480)
	self.position.y = rand_range(20,380)
	

func _process(delta):
	if dragging:
		var mousePos = get_viewport().get_mouse_position()
		set_global_position(mousePos)
		var collider = $CollisionShape2D.shape
		self.position.x = clamp(self.position.x,collider.height,500-collider.height)
		self.position.y = clamp(self.position.y,collider.radius,400-collider.radius)

func _on_dragsignal():
	print(self.position)
	dragging=!dragging

func _on_Fragment_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed and dragging:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			emit_signal("clicksignal",self)
