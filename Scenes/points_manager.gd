extends Node

class_name PointsManager

@onready var ui = $"../UI" as UI

const BASE_POINTS_FOR_GHOST_VALUE = 200 
const BASE_POINTS_FOR_PALLETS = 1

var points_for_pallets_eaten = BASE_POINTS_FOR_PALLETS
var points_for_ghost_eaten = BASE_POINTS_FOR_GHOST_VALUE
var points = 0

func pause_on_ghost_eaten():
	points += points_for_ghost_eaten
	get_tree().paused = true
	await get_tree().create_timer(1.0).timeout
	get_tree().paused = false
	points_for_ghost_eaten += BASE_POINTS_FOR_GHOST_VALUE
	ui.set_score(points)
func add_points_for_pellet():
	points += BASE_POINTS_FOR_PALLETS
	ui.set_score(points)
func pause_on_pallets_eaten():
	points += points_for_pallets_eaten
	points_for_pallets_eaten += BASE_POINTS_FOR_PALLETS
	ui.set_score(points)

func reset_points_for_pallets():
	points_for_pallets_eaten = BASE_POINTS_FOR_PALLETS

func reset_points_for_ghosts():
	points_for_ghost_eaten = BASE_POINTS_FOR_GHOST_VALUE
