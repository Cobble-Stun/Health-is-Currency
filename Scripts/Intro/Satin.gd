extends Sprite2D

@onready var dialogue = get_parent().get_node("Dialogue")
@onready var laugh = get_parent().get_node("Laugh")
var triggerOnce = true

func _process(_delta):
	if dialogue.count == 8:
		get_tree().change_scene_to_file("res://Scenes/Street.tscn")

func _on_dialogue_body_entered(body):
	if body.name == "Player":
		self.visible = true
		if triggerOnce == true:
			triggerOnce = false
			laugh.play()
	else:
		self.visible = false
