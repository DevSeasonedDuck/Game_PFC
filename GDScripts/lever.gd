extends Area2D

@onready var interaction_area = $InteractionArea
@onready var door=get_child(3)

func _ready():
	interaction_area.interact=Callable(self, "_use_door")
	
func _use_door():
	door.hideDoor()
