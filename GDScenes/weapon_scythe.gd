extends Node2D
var isPLaying : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimationPlayer.play("slashGround")
	


func _on_animation_player_animation_finished(anim_name):
	queue_free()

