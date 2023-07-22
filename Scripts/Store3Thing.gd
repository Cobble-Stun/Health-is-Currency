extends Node

@onready var chemNumberText = get_parent().get_node("Store3/Text/Item descriptions")

func _on_store_3_body_entered(body):
	chemNumberText.text = "You have " + str(globals.mysteryChems)
