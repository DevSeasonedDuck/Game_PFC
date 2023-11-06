extends Control

var is_paused=false

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if is_paused==false:
		get_tree().paused=true
		is_paused=true
		$PauseMenu.show()
	else:
		get_tree().paused=false
		is_paused=false
		$PauseMenu.hide()
