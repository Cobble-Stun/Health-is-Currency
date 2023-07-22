extends "res://Scripts/Store.gd"

@onready var itemlist = $Text/ItemList

func _on_item_list_item_clicked(index, _at_position, _mouse_button_index):
	playerSound.stream = buySound
	playerSound.play()
	match index:
		0: 
			globals.debt += 200000
			globals.mysteryChems += 1
		1: 
			globals.debt += 20000
			globals.health += 1
