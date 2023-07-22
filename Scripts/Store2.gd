extends "res://Scripts/Store.gd"

@onready var itemlist = $Text/ItemList

func _on_item_list_item_clicked(index, _at_position, _mouse_button_index):
	playerSound.stream = buySound
	playerSound.play()
	match index:
		0: 
			globals.debt += 150000
			globals.health += 5
		1: 
			globals.debt += 100000
			globals.health += 3
		2:
			globals.debt += 50000
			globals.health += 2
