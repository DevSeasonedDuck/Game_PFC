extends Area2D

@onready var interaction_area = $InteractionArea
@onready var activateable=get_child(3)

# A lever controlls whenever a door is going to be opened or closed. Based on the InteractManager autoload

func _ready():
	interaction_area.interact=Callable(self, "_use")
	
func _use():
	activateable.activate()
