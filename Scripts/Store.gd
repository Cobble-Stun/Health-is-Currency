extends Area2D

var inStore = false
@onready var text = $Text
@export var textMessage: String


func _on_body_entered(body):
	if body.name == "Player":
		text.visible = true
		inStore = true

func _on_body_exited(body):
	if body.name == "Player":
		text.visible = false
		inStore = false
