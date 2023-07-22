extends Area2D

var canSleep = false

@onready var timer = $Timer

func _process(_delta):
	if canSleep == true and Input.is_action_just_pressed("Sacrifice"):
		sleep()


func sleep():
	globals.dayNumber += 1
	
func _on_body_entered(body):
	if body.name == "Player":
		canSleep = true


func _on_body_exited(body):
	if body.name == "Player":
		canSleep = false
