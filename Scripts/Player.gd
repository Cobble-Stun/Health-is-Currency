extends CharacterBody2D

const SPEED = 450.0
var dead = false
var laugh = preload("res://Sounds/Satanic laugh.ogg")

@onready var timer = $Timer
@onready var camera = $Camera2D
@onready var playerSprite = $AnimatedSprite2D
@onready var playerSfx = $AudioStreamPlayer
@onready var gameOverUI = get_parent().get_node("Phone/GameOverUI")
@onready var musicPlayer = get_parent().get_node("Music")

func _physics_process(delta):
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
		playerSprite.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, 7 * SPEED * delta)
		playerSprite.play("Idle")
		
func _process(_delta):
		#camera stuff
	if Input.is_action_just_pressed("Left"):
		playerSprite.flip_h = true
		camera.drag_horizontal_offset = -1
	elif Input.is_action_just_pressed("Right"):
		playerSprite.flip_h = false
		camera.drag_horizontal_offset = 1
		
	if globals.health > 100:
		globals.health = 100
	
	move_and_slide()
	DeathCheck()
	WinCheck()
		
func DeathCheck():
	if globals.health <= 0 and !dead or globals.debt >= 10000000000 and !dead or globals.dayNumber >= 4 and globals.debt > 0 and !dead:
		Die()
func Die():
	playerSfx.stream = laugh
	playerSfx.play()
	dead = true
	gameOverUI.visible = true
	musicPlayer.stop()
	timer.start()
	await timer.timeout
	globals.health = 100
	globals.debt = 9999999999
	globals.civilianAmount = 7
	globals.dayNumber = 1
	globals.mysteryChems = 0
	dead = true
	get_tree().change_scene_to_file("res://Scenes/Apartment.tscn")

func WinCheck():
	if globals.debt <= 0:
		get_tree().change_scene_to_file("res://Scenes/End.tscn")
	
		
