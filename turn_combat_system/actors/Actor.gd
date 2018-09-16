extends Node

export (int) var damage = 1
export (int) var defense = 1
var active = false setget set_active

signal turn_finished

func set_active(value):
	active = value
	set_process(value)
	set_process_input(value)
	
func attack(target):
	target.take_damage(damage)
	emit_signal("turn_finished")

func defend():
	$Health.armor += defense
	emit_signal("turn_finished")

func consume(item):
	item.use(self)
	emit_signal("turn_finished")
	
func flee():
	emit_signal("turn_finished")
	
func take_damage(damage):
	$Health.take_damage(damage)
	$Sprite/AnimationPlayer.play("take_damage")
