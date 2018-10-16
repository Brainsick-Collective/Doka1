extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }
var num_players = 3 
func _ready():
	var player1 = get_node("map/player1")
	var player2 = get_node("map/player2")
	var player3 = get_node("map/player3")
	player1.connect("next_turn",self,"next_turn")
	player2.connect("next_turn",self,"next_turn")
	player3.connect("next_turn",self,"next_turn")
	var board = get_node("map")
	for child in board.get_children():
		if child.type == OBJECT:
			board.set_cellv(board.world_to_map(child.position), child.type)
	player1.start_turn()


func next_turn(playerID):
	var next_player
	if playerID< num_players:
		playerID+=1
	else:
		playerID=1
	next_player = get_node("map/player" + str(playerID))
	next_player.start_turn()
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
