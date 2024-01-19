extends "res://Skill/Skill.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func active():
	pass
	var skill_direction = position.direction_to(get_global_mouse_position())
	hitbox = $hitbox
	hitbox_shape = RectangleShape2D.new()
	hitbox_shape.extents = Vector2(3, 2)
	hitbox.shape = hitbox_shape
