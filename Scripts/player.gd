extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	gravity_set(delta)
	jump_set()
	player_move(delta)
	anim_dir()
	move_and_slide()

# Gravity Settings
func gravity_set(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

#Player Jump 
func jump_set():
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

# Player Movement 
func player_move(delta):
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

#Player Sprite directions
func anim_dir():
	if velocity.x > 1:
		animated_sprite_2d.flip_h = false
	if velocity.x < -1:
		animated_sprite_2d.flip_h = true
