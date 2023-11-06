extends Area2D

@onready var interaction_area = $InteractionArea
@onready var activateable=get_child(3)

func _ready():
	interaction_area.interact=Callable(self, "_use")
	
func _use():
	activateable.activate()
