extends KinematicBody2D

var dragging = false
var id

signal dragsignal
signal clicksignal

func _ready():
	connect("dragsignal",self,"_on_dragsignal")
	var graph = get_parent().get_parent()
	self.connect("clicksignal",graph,"setJoin")
	self.position.x = rand_range(20,280)
	self.position.y = rand_range(20,220)
	

func _process(_delta):
	if dragging:
		var mousePos = get_viewport().get_mouse_position()
		set_global_position(mousePos)
		var collider = $CollisionShape2D.shape
		self.position.x = clamp(self.position.x,collider.height,300-collider.height)
		self.position.y = clamp(self.position.y,collider.radius,240-collider.radius)

func _on_dragsignal():
	print(self.position)
	dragging=!dragging

func _on_Fragment_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_LEFT and !event.pressed and dragging:
			emit_signal("dragsignal")
		elif event.button_index == BUTTON_RIGHT and event.pressed:
			emit_signal("clicksignal",self)
