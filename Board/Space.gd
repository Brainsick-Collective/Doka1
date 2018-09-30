extends Node2D

enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }
var type = OBJECT

export(NodePath) var left
export(NodePath) var right
export(NodePath) var up
export(NodePath) var down


func _ready():
	pass

func try_move(direction):
	print("try move") 
	print(direction)
	var leftv = Vector2(-1,0)
	var rightv = Vector2(1,0)
	var upv = Vector2(0,-1)
	var downv = Vector2(0,1)
	var ret
	match direction:
		upv:
			print("up")
			ret = up
		downv:
			print("down")
			ret = down
		rightv:
			print("right")
			ret = right
		leftv:
			print("left")
			ret = left
	if ret:
		return get_node(ret)
	print("null")
	return null
		
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
