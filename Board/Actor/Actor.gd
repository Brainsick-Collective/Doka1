extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#export(NodePath) var curr_space
enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }
var type = ACTOR
export (NodePath) var curr_space
var speed = 500