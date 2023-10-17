extends CharacterBody2D


const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var chase:bool=false
@onready var target = $"../Player"

func _physics_process(_delta):
	if chase==true:
		if target==null:
			get_tree().get_nodes_in_group("Player")
		if target != null:
			velocity = position.direction_to(target.position)*SPEED
			move_and_slide()


func _on_area_2d_area_entered(_area):
	chase=true


func _on_hitbox_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()


func _on_hitbox_area_entered(area):
	if area.is_in_group("PlayerAttacks"):
		queue_free()
