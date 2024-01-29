extends "res://item/item.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _init():
	item_name = "evodisc"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func effect(body):
	body.initialize_skill_with_script(0, "res://Skill/skill_basic.gd")

func pick_up_item(body):
	.pick_up_item(body)
	
func _physics_process(delta):
	._physics_process(delta)


