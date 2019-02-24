extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$NewGameMenu.connect("startGame",self, "_on_NewGameMenu_startGame")
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_NewGameMenu_startGame(numPlayers):
	var gameBoard = preload("res://scenes/board/board.tscn").instance()
	print(numPlayers)
	gameBoard.initialize(numPlayers) # init root node
	add_child(gameBoard)
	


func _on_MainMenu_newGame():
	print("signal recieved")
	$NewGameMenu.open()
	pass # replace with function body
