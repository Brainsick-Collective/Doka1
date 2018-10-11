extends "actor.gd"

var target_space
var moving = false
var myTurn = false
var moves_left = 0
signal next_turn
var spaces_moved

func _ready():
	#$moves.set_anchor(position - Vector2(32,96))
	$moves.set_text(str(moves_left))
	
	if !myTurn:
		set_process(false)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	for node in get_parent().get_children():
		if node.position == position and node != self:
			curr_space = node
	
func _process(delta):
	$moves.text=str(moves_left)
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
	#$Tween.start()

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
		set_process_input(true)
		moving=false
		if !spaces_moved.empty():
			if target == spaces_moved.back():
				moves_left+=1
				spaces_moved.pop_back()
				curr_space = target_space		
				target_space = null
				return
		moves_left-=1
		spaces_moved.push_back(curr_space.position)
		curr_space = target_space		
		target_space = null
		if moves_left == 0:
			myTurn=false
			$moves.hide()
			set_process(false)
			emit_signal("next_turn", int(name.right(5)))
		

func start_turn():
	spaces_moved = Array()
	myTurn = true
	moves_left = 3
	set_process(true)
	$moves.show()

func bump():
	$AnimationPlayer.play("bump")

