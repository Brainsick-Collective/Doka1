extends "res://interface/Menu.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal newGame()

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func open():
	.open()
	
func close():
	.close()
	

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_NewGame_pressed():
	print("new game pressed")
	emit_signal("newGame")
	set_process_input(false)
	queue_free()
