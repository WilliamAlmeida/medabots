extends Node2D

enum states {idle, walk, atk_head, atk_arm_l, atk_arm_r}

export(states) var state = states.idle

var obj_arm_r
var obj_legs
var obj_head
var obj_arm_l

var cur_animation = null
export var control : bool = false
export var speed_move = 3

var on_walk : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	obj_head = get_node("pivot_head").get_child(0)
	obj_arm_l = get_node("pivot_arm_l").get_child(0)
	obj_arm_r = get_node("pivot_arm_r").get_child(0)
	obj_legs = get_node("pivot_legs").get_child(0)
	
	obj_head.position = get_parent().position
	obj_arm_l.position = get_parent().position
	obj_arm_r.position = get_parent().position
	obj_legs.position = get_parent().position
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	var animation = null
	match state:
		states.idle:
			animation = "idle"
		states.walk:
			animation = "walk"
		states.atk_head:
			animation = "atk_head"
		states.atk_arm_l:
			animation = "atk_arm_l"
		states.atk_arm_r:
			animation = "atk_arm_r"
		_:
			animation = "default"

	if cur_animation != animation:
		cur_animation = animation
		if obj_head:
			obj_head.visible = true
			if animation:
				if obj_head.get_node("AnimationPlayer").has_animation(animation):
					obj_head.get_node("AnimationPlayer").play(animation)
				else:
					obj_head.get_node("AnimationPlayer").play("default")

		if obj_arm_l:
			obj_arm_l.visible = true
			if animation:
				if obj_arm_l.get_node("AnimationPlayer").has_animation(animation):
					obj_arm_l.get_node("AnimationPlayer").play(animation)
				else:
					obj_arm_l.get_node("AnimationPlayer").play("default")

		if obj_arm_r:
			obj_arm_r.visible = true
			if animation:
				if obj_arm_r.get_node("AnimationPlayer").has_animation(animation):
					obj_arm_r.get_node("AnimationPlayer").play(animation)
				else:
					obj_arm_r.get_node("AnimationPlayer").play("default")

		if obj_legs:
			obj_legs.visible = true
			if animation:
				if obj_legs.get_node("AnimationPlayer").has_animation(animation):
					obj_legs.get_node("AnimationPlayer").play(animation)
				else:
					obj_legs.get_node("AnimationPlayer").play("default")

	if control:
		var move_direction = Vector2.ZERO

		if Input.is_action_pressed("ui_up"):
			move_direction.y = -1
		elif Input.is_action_pressed("ui_down"):
			move_direction.y = 1

		if Input.is_action_pressed("ui_left"):
			move_direction.x = -1
		elif Input.is_action_pressed("ui_right"):
			move_direction.x = 1

		if move_direction != Vector2.ZERO:
			state = states.walk
			self.global_position += move_direction * speed_move
		else:
			state = states.idle
	
	if Input.is_action_just_pressed("atk_head"):
		state = states.atk_head
	elif Input.is_action_just_pressed("atk_arm_l"):
		state = states.atk_arm_l
	elif Input.is_action_just_pressed("atk_arm_r"):
		state = states.atk_arm_r
	elif Input.is_action_just_pressed("ui_cancel"):
		state = states.idle
#	pass
