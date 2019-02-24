extends "res://interface/Menu.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal startGame()
export(int) var numPlayers

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	numPlayers=1
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Start_pressed():
	#get_tree().change_scene("res://scenes/board/board.tscn")
	emit_signal("startGame",numPlayers)
	.close()

func _on_SpinBox_value_changed(value):
	numPlayers = value
	print("num players")
	print(numPlayers)
	pass # replace with function body


func _on_Back_pressed():
	.close()
	get_tree().change_scene("res://interface/MainMenuController.tscn")
