extends ProgressBar

# Shows player's current life points percentage.

@onready var character = get_parent().get_parent()

func _ready():
	# Updates on real time showing player's current life points
	character.healthChanged.connect(update)
	update()

func update():
	# Calculates player life points
	value =character.currentHealth *100/character.maxHealth
