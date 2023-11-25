extends CharacterBody2D

#Health variables
@onready var h_bar = $"../HealthBar/HBar"
var player_health 
const player_damage = 5

# Movement variables
const SPEED = 400.0
const JUMP_VELOCITY = -400.0

# Main Variables
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var gpu_particles_2d = $GPUParticles2D
@onready var damage_sfx = $DamageSFX
@onready var jump_sfx = $JumpSFX



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
		jump_sfx.play()
		gpu_particles_2d.emitting = true


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


# Spike Wall detect and damage
func entered_spike_wall(area):
	player_health = h_bar.value
	player_health -= player_damage
	damage_sfx.play()
	h_bar.value = player_health
	
	# Changes to credit screen if low health
	if player_health == 0:
		get_tree().change_scene_to_file("res://Scenes/credit_menu.tscn")



