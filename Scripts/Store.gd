extends Area2D

@onready var text = $Text

func _on_body_entered(body):
	if body.name == "Player":
		text.visible = true
	else:
		text.visible = false

func _on_body_exited(body):
	if body.name == "Player":
		text.visible = false
