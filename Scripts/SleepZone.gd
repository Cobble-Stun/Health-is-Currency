extends Area2D

var canSleep = false

@onready var timer = $Timer
@onready var sleepBlack = get_parent().get_node("Phone/Sleep")
@onready var soundPlayer = get_parent().get_node("Music")
@onready var text = $RichTextLabel

func _process(_delta):
	if canSleep == true and Input.is_action_just_pressed("Sacrifice"):
		sleep()


func sleep():
	soundPlayer.stop()
	globals.dayNumber += 1
	globals.health = 100
	globals.civilianAmount = 7
	sleepBlack.visible = true
	timer.start()
	await timer.timeout
	get_tree().change_scene_to_file("res://Scenes/Apartment.tscn")
	
func _on_body_entered(body):
	if body.name == "Player":
		canSleep = true
		text.visible = true


func _on_body_exited(body):
	if body.name == "Player":
		canSleep = false
		text.visible = false
