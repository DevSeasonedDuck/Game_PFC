extends Area2D
class_name Hitbox



func _on_area_entered(hitbox: Hitbox) -> void:
	if hitbox== null:
		return
