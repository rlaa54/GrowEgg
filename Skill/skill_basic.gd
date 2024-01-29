extends "res://Skill/Skill.gd"

func _init():
	print("before signal")
	emit_signal("skill_initialize")
	print("after signal")
	
func skill_init():
	set_skill_owner(self)
	set_skill_range_type("melee")
	set_skill_range(60)
	hitbox = get_node("Area2D/hitbox")
	hitbox_shape = RectangleShape2D.new()
	hitbox_shape.extents = Vector2(3, 2)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	print("skill_basic_ready")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func skill_active():
	set_skill_direction(get_parent().direction_arrow_pos)
	hitbox.shape = hitbox_shape
	set_skill_position(get_skill_direction() * get_skill_range())
	position = get_skill_position()
