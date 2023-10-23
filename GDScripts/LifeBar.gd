extends ProgressBar
@onready var character = get_parent().get_parent()

func _ready():
	character.healthChanged.connect(update)
	update()

func update():
	value =character.currentHealth *100/character.maxHealth
	print(value)
