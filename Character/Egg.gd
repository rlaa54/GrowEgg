extends KinematicBody2D

export var speed = 400

signal hurt

var screen_size
var evolution_Gauage = 0
var current_hp
var MAX_HP
var direction_arrow_pos
var current_skill
var skill_slot

func initialize_skill_slots():
	skill_slot = [$Skill1, $Skill2, $Skill3]
	
func initialize_skill_with_script(slot_index, script_path):
	skill_slot[slot_index].connect("skill_initialize", skill_slot[slot_index], "skill_init")
	skill_slot[slot_index].set_script(load(script_path))	
	
func skill_select(slot_index):
	current_skill = skill_slot[slot_index]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	initialize_skill_slots()

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
	direction_arrow_pos = position.direction_to(facing)
	var rotPosition = direction_arrow_pos * radius
	$Direction2.position = rotPosition
	
	if Input.is_action_just_released("active"):
		if current_skill != null:
			current_skill.skill_active()
	
	if Input.is_action_just_released("skill_select1"):
		skill_select(0)
	if Input.is_action_just_released("skill_select2"):
		skill_select(1)
		
	if evolution_Gauage == 100:
		evolution_Gauage = 0
		current_hp = MAX_HP

func _on_Egg_body_entered(body):
	emit_signal("hurt")
