extends Area2D
class_name Medkit

@onready var interaction_area=$InteractionArea

func _ready():
	interaction_area.interact=Callable(self, "_use_medkit")

func _use_medkit():
	queue_free()
