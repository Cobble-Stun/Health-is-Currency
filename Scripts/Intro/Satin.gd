extends Sprite2D

@onready var dialogue = get_parent().get_node("Dialogue")

func _process(_delta):
	if dialogue.count == 6:
		get_tree().change_scene_to_file("res://Scenes/Street.tscn")

func _on_dialogue_body_entered(body):
	if body.name == "Player":
		self.visible = true
	else:
		self.visible = false
