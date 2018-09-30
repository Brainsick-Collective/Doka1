extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
#export(NodePath) var curr_space
enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }
var type = ACTOR
var curr_space

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	curr_space=get_parent().get_node("Space")
	print("curent space")
	print(curr_space.name)
	pass

func _process(delta):
	var input_direction = get_input_direction()
	if not input_direction:
		return
	update_look_direction(input_direction)
	set_process(false)
	var target_space
	if curr_space:
		self.position = curr_space.position
		target_space = curr_space.try_move(input_direction)
		#target_space = get_node(target_space)
		if target_space:
			move_to(target_space.position)
			curr_space = target_space
		$Tween.start()
	set_process(true)

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

func move_to(target_position):
	print("target_position")
	print(target_position)
	set_process(false)
	var move_direction = (position - target_position).normalized()
	#$Tween.interpolate_property($Pivot, "position", move_direction * 32, Vector2(), $AnimationPlayer.current_animation_length, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#$Pivot/Sprite.position = position - target_position
	position = position + 1/2 * move_direction
	if position == target_position:
		set_process(true)

func bump():
	$AnimationPlayer.play("bump")

