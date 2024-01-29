extends Node2D
signal skill_initialize
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var hitbox = null
var hitbox_shape = null
var skill_owner = null
var skill_target = null
var skill_direction = null
var skill_pos = null
var skill_range = null
var skill_range_type = null

func set_skill_owner(value):
	skill_owner = value
func get_skill_owner():
	return skill_owner

func set_skill_target(value):
	skill_target = value
func get_skill_target():
	return skill_target

func set_skill_direction(value):
	skill_direction = value
func get_skill_direction():
	return skill_direction

func set_skill_position(value):
	skill_pos = value
func get_skill_position():
	return skill_pos

func set_skill_range(value):
	skill_range = value
func get_skill_range():
	return skill_range

func set_skill_range_type(value):
	if value == "melee" or value == "ranged":
		skill_range_type = value
	else:
		print("Invalid skill range type. It must be either 'melee' or 'ranged'.")
func get_skill_range_type():
	return skill_range_type
	
# 스킬 초기화
func skill_init():
	pass
	
func skill_active():
	pass
