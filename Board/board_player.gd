extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#export(NodePath) var curr_space
enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }
var type = ACTOR
var curr_space
var speed = 500
var target_space
var moving = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	curr_space=get_parent().get_node("Space")
	print("curent space")
	print(curr_space.name)
	pass

func _process(delta):
	var input_direction = get_input_direction()
	if input_direction and !moving:
		update_look_direction(input_direction)
	if curr_space and !moving:
		target_space = curr_space.try_move(input_direction)
		#target_space = get_node(target_space)
		if target_space:
			moving=true
	if target_space:
		move_towards(position, target_space.position, delta)
	$Tween.start()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func get_input_direction():
	return Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	)

func update_look_direction(direction):
	$Pivot/Sprite.rotation = direction.angle()

func move_towards(start, target, delta):
	set_process_input(false)
	var v = (target - start).normalized()
	v *= delta* speed
	position +=v
	if position.distance_squared_to(target) < 15:
		print("here!")
		curr_space = target_space
		target_space = null
		set_process_input(true)
		moving=false
		

func bump():
	$AnimationPlayer.play("bump")

