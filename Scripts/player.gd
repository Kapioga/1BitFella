extends CharacterBody2D

#Health variables
@onready var h_bar = $"../HealthBar/HBar"
var player_health 

# Movement variables
const SPEED = 400.0
const JUMP_VELOCITY = -400.0

# Gravity variables
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var gpu_particles_2d = $GPUParticles2D


func _physics_process(delta):
	gravity_set(delta)
	jump_set()
	player_move()
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
func player_move():
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		gpu_particles_2d.emitting = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		gpu_particles_2d.emitting = false

#Player Sprite directions
func anim_dir():
	if velocity.x > 1:
		animated_sprite_2d.flip_h = false
	if velocity.x < -1:
		animated_sprite_2d.flip_h = true

#Spike Wall detect and damage
func entered_spike_wall(area):
	player_health = h_bar.value
	print("Oof, you touched the wall!")
	player_health -= 5
	h_bar.value = player_health
	print("Players health is: ", str(player_health))

