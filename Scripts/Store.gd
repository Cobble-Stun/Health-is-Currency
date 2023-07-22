extends Area2D

var inStore = false
var buySound = preload("res://Sounds/Buy.ogg")

@onready var text = $Text
@onready var playerSound = get_parent().get_node("Player/AudioStreamPlayer")

func _on_body_entered(body):
	if body.name == "Player":
		text.visible = true
		inStore = true

func _on_body_exited(body):
	if body.name == "Player":
		text.visible = false
		inStore = false
