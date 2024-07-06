extends AnimatedSprite2D
@onready var ktk_1 = $"."


# Called when the node enters the scene tree for the first time.
func _ready():
	ktk_1.play("default",0.5)


