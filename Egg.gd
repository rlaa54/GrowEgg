extends KinematicBody2D

export (PackedScene) var parts_scene
export var speed = 400

signal hit
signal eat

var screen_size
var evolution_Gauage = 0
var current_hp
var MAX_HP

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	var radius = 50 # 원의 반지름
	var facing = get_global_mouse_position()
	
	$Direction2.look_at(facing)
	var rotPosition = position.direction_to(facing) * radius
	$Direction2.position = rotPosition
	
	if evolution_Gauage == 100:
		evolution_Gauage = 0
		current_hp = MAX_HP
	
func attack():
	var attackarea = CollisionShape2D.new()
	attackarea.draw_rect()
	attackarea.position()


func _on_Egg_body_entered(body):
	emit_signal("hit")
