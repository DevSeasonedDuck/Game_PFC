extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var chase:bool=false
@onready var target = $"../Player"

func _physics_process(_delta):
	if chase==true:
		if target==null:
			get_tree().get_nodes_in_group("Player")[0]
		if target != null:
			velocity = position.direction_to(target.position)*SPEED
			move_and_slide()


func _on_area_2d_area_entered(_area):
	chase=true


