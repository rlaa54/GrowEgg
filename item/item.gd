extends KinematicBody2D

var item_name
var item_type
var MAX_SPEED = 225
var ACCELERATION = 400
var velocity = Vector2.ZERO

var player = null
var being_picked_up = false
var distance
# Called when the node enters the scene tree for the first time.
func _ready():
	item_name = "item"


func _physics_process(delta):
	if being_picked_up == true:
		var direction = global_position.direction_to(player.global_position)
		velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
		
		var distance = global_position.distance_to(player.global_position)
		if distance < 20:
			queue_free()
	velocity = move_and_slide(velocity, Vector2.UP)
		
func pick_up_item(body):
	player = body
	being_picked_up = true
	effect(player)

func effect(body):
	pass
