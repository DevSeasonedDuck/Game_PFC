extends Node2D
var isPLaying : bool = false

# Called when the node enters the scene tree for the first time.
func _animations(onGround):
	if onGround==true:
		$AnimationPlayer.play("slashGround")
	else:
		$AnimationPlayer.play("slash_round_air")






func _on_animation_player_animation_finished(anim_name):
	queue_free()
