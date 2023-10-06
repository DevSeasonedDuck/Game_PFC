extends CharacterBody2D

const NORMAL_SPEED=400.0
var SPEED = NORMAL_SPEED
const JUMP_VELOCITY = -450.0
#Preload for the "Bullet" scene. Required to instance bullets.
const bulletPath = preload("res://bullet.tscn")
var JUMP_COUNTER=2 


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")+100


func _ready():
	scale.normalized()
	print(scale)

func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		#If defined for when the player is on air whithout jumping previously, not keeping two jumps on air and instead just could jump once
		if JUMP_COUNTER==2:
			JUMP_COUNTER=JUMP_COUNTER-1;
	else:
		JUMP_COUNTER=2
		
	# Get the input direction and handle the movement/deceleration.
	var directionH = Input.get_axis("go_left", "go_right")
	if directionH:
		velocity.x = directionH * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
		
	# Jump.
	if Input.is_action_just_pressed("jump") and JUMP_COUNTER>0:
		rumble_controller()
		if Input.is_action_pressed("sprint"):
			velocity.y = JUMP_VELOCITY*1.15
		else:
			velocity.y = JUMP_VELOCITY
		JUMP_COUNTER=JUMP_COUNTER-1
		
	# Sprint code.
	# Keep "shift" pressed to sprint. Release for get back to default speed.
	if Input.is_action_just_pressed("sprint"):
		SPEED=SPEED+250
	if Input.is_action_just_released("sprint") and SPEED!=NORMAL_SPEED:
		SPEED=NORMAL_SPEED

	# Press "S" when on air for fast fall. Increases fall velocity.
	if Input.is_action_just_pressed("go_down") and not is_on_floor():
		velocity.y=-(JUMP_VELOCITY*1.75)+(JUMP_VELOCITY/1.5)
	#Stop pressing "S" for returning to normal fall velocity.
	if Input.is_action_just_released("go_down") and not is_on_floor():
		velocity.y=-JUMP_VELOCITY
		
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
	
		
	move_and_slide()
	
# Using the InputHelper plugin
func rumble_controller():
	InputHelper.rumble_small() #Detects controller input and triggers a rumble on the controller

# Shooting bullets
func shoot():
	var _Bullet=bulletPath.instantiate()
	add_child(_Bullet)
	_Bullet.global_position=self.position+Vector2(40,0)
	InputHelper.rumble_small()
	
