extends KinematicBody
 
var path = []
var path_ind = 0
const move_speed = 12
onready var nav = get_parent()

func _process(delta):
	if path_ind < path.size():
		var move_vec = (path[path_ind] - global_transform.origin)
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			move_and_slide(move_vec.normalized() * move_speed, Vector3(0, 1, 0))
 
func move_to(target_pos):
	print(global_transform.origin)
	print(target_pos)
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_ind = 0
