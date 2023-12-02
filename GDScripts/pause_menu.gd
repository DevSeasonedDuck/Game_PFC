extends Control

@export var game_manager : GameManager

# Menu showed when the player pauses the game.

func _ready():
	# By default, the game won't be paused, so the menu keeps hidden but still kept in memory
	hide()
	game_manager.connect("toggle_game_paused", _on_game_manager_toggle_game_paused)

func _on_game_manager_toggle_game_paused(is_paused : bool):
	if is_paused:
		show()
		# grab_focus will point to a button and make it de first option.
		# Made for appropiate game controllers experience.
		$Panel/VBoxContainer/ResumeButton.grab_focus()
	else:
		hide()

# Button for game resuming
func _on_resume_button_pressed():
	game_manager.game_paused = false

# Button for main menu navigation
func _on_main_menu_button_pressed():
	game_manager.game_paused = false
	get_tree().change_scene_to_file("res://GDScenes/main_menu.tscn")
