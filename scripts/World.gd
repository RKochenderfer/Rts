extends Spatial

var dragging = false
var selected = []
var drag_start = Vector3.ZERO
var seelct_rect = RectangleShape2D.new()

func _ready():
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			# We only want to start a drag if there's no selection.
			if selected.size() == 0:
				dragging = true
				drag_start = event.position
		elif dragging:
			# Button released while dragging.
			dragging = false
	if event is InputEventMouseMotion and dragging:
		print('Update')

func _draw():
	if dragging:
		draw_rect(Rect2(drag_start, get_global_mouse_position() - drag_start),
				Color(.5, .5, .5), false)

