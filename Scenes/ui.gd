extends CanvasLayer

class_name UI

@onready var center_container = $MarginContainer/CenterContainer
@onready var life_count_label = %LifeCountLabel
@onready var game_score_label = %GameScoreLabel
@onready var game_label = %GameLabel
@onready var button = $MarginContainer/CenterContainer/Panel/Button


var main = "res://Scenes/main.tscn"
var score1 : int
const JOYPAD_BUTTON_A = 0


func set_lifes(lifes):
	life_count_label.text = "%d up" % lifes
	if lifes == 0: 
		game_lost()

func _process(delta):
	# Debug print, can be removed if not needed
	print(score1)

func set_score(score):
	game_score_label.text = "SCORE: %d" % score
	score1 = score

func game_lost():
	game_label.text = "Your score: " + str(score1)
	center_container.show()
	grab_focus()

func game_won():
	game_label.text = "Your score: " + str(score1)
	center_container.show()
	grab_focus()

func grab_focus():
	button.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file(main)

func _input(event):
	if event is InputEventJoypadButton:
		if event.pressed:
			match event.button_index:
				JOYPAD_BUTTON_A:
					press_button()

func press_button():
	if center_container.visible and button.has_focus():
		_on_button_pressed()
