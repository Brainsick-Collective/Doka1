extends TileMap

enum CELL_TYPES { ACTOR, OBSTACLE, OBJECT }
export(NodePath) var dialog_ui

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.type)

func get_cell_pawn(cell, type = ACTOR):
	for node in get_children():
		if node.type != type:
			continue
		if world_to_map(node.position) == cell:
			return(node)

func try_direction(cell_start, direction):
	var cell_target = cell_start + direction
	var cell_target_type = get_cellv(cell_target)
	while cell_target_type != OBJECT and cell_target_type != ACTOR:
		cell_target = cell_target + direction
		cell_target_type = get_cellv(cell_target)
		if cell_target.x <0 or cell_target.x > 1300 or cell_target.y <0 or cell_target.y > 1300:
			return cell_start
	return cell_target
			
func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = try_direction(cell_start, direction)
	var cell_tile_id = get_cellv(cell_target)
	var target_pawn = get_cell_pawn(cell_target,cell_tile_id)
	if not target_pawn.has_node("DialogPlayer"):
		return map_to_world(cell_target) + cell_size / 2
	get_node(dialog_ui).show_dialog(pawn, target_pawn.get_node("DialogPlayer"))
	return map_to_world(cell_target) + cell_size / 2
