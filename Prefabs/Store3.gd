extends "res://Scripts/Store.gd"

@onready var chemNumberText = $"Text/Item descriptions"

func _on_item_list_item_clicked(_index, _at_position, _mouse_button_index):
	if globals.mysteryChems >= 3:
		playerSound.stream = buySound
		playerSound.play()
		globals.debt -= 1000000
		globals.mysteryChems -= 3
		chemNumberText.text = "You have " + str(globals.mysteryChems)
