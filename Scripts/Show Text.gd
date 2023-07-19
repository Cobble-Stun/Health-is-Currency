extends Area2D

var showText
@export var count = 0
@export var dialogueArray = []
@onready var text = $RichTextLabel

func _process(_delta):
	if showText == false:
		text.visible = false
		text.text = ""
	else:
		if count > dialogueArray.size() - 1:
			count -= 1
		elif count < 0:
			text.visible = true
			text.text = "The dev forgot to add dialogue."
		else: 
			text.visible = true
			text.text = dialogueArray[count]
		
		if Input.is_action_just_pressed("Advance"):
			count += 1
	
func _on_body_entered(body):
	if body.name == "Player":
		showText = true
	else: 
		showText = false

func _on_body_exited(body):
	if body.name == "Player":
		showText = false
