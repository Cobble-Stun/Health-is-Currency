extends Sprite2D

@export var panels = []
@export var count = 0
func _ready():
	self.texture = panels[count]

func _process(_delta):
	if Input.is_action_just_pressed("Advance"):
		count += 1
	if count <= 4:
		self.texture = panels[count]
	elif count > 4:
		get_tree().change_scene_to_file("res://Scenes/Apartment Intro.tscn")

