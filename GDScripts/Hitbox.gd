extends Area2D
class_name Hitbox

# Area2D built to act as the player's and enemies hitbox

func _on_area_entered(hitbox: Hitbox) -> void:
	if hitbox== null:
		return
