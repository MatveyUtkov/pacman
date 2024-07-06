extends CanvasLayer
@onready var popup = $Popup
@onready var label = $Popup/Label
func _ready():
	popup.hide()

func show_score_popup(score):
	label.text = "Your score: " + str(score)
	popup.popup_centered()  # Show the popup centered on the screen
func on_player_death(score):
	show_score_popup(score)
func on_player_win(score):
	show_score_popup(score)
