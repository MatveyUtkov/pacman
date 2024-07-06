extends CanvasLayer
@onready var animation_player = $AnimationPlayer
var main= "res://Scenes/main.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("fade_out")
	await animation_player.animation_finished
	get_tree().change_scene_to_file(main)
	
