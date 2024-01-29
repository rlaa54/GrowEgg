extends "res://item/item.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _init():
	item_name = "evo"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func effect(body):
	body.evolution_Gauage += 1

func pick_up_item(body):
	.pick_up_item(body)

func _physics_process(delta):
	._physics_process(delta)
