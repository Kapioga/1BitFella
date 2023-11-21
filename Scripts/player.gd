extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var trails = $Trails


func _physics_process(delta):
	gravity_set(delta)
	jump_set()
	player_move()

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
		trails.emitting = true
		
	elif velocity.x < -1:
		trails.direction.x = -1
		
	elif velocity.x > 1:
		trails.direction.x = 1
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		trails.emitting = false

#Detects Spike
func _on_area_2d_body_entered(body):
	print("Spike Touched!")
