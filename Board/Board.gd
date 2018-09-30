extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }

func _ready():
	var board = get_node("map")
	for child in board.get_children():
		print(child.name)
		if child.type == OBJECT:
			board.set_cellv(board.world_to_map(child.position), child.type)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
