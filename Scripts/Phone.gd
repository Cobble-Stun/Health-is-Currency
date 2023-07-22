extends CanvasLayer

var phoneUp = false
var sacrificeSound = preload("res://Sounds/Soul Sacrifice.wav")

@onready var soundPlayer = get_parent().get_node("Player/AudioStreamPlayer")
@onready var phoneOverlay = $PhoneOverlay
@onready var animPlayer = $PhoneOverlay/AnimationPlayer
@onready var healthText = $PhoneOverlay/Health
@onready var debtText = $PhoneOverlay/Debt

func _ready():
	phoneOverlay.visible = false
	healthText.visible = false
	debtText.visible = false

func _process(_delta):
	PhoneCheck()
	SacrificeHealth()
		
func PhoneCheck():
	if Input.is_action_just_pressed("Phone") and !phoneUp:
		phoneUp = true
		phoneOverlay.visible = true
		healthText.visible = true
		debtText.visible = true
		healthText.text = "Vitality: " + str(globals.health)
		debtText.text = "Debt: " + str(globals.debt)
		animPlayer.play("Bring Up")
	elif Input.is_action_just_pressed("Phone") and phoneUp:
		phoneUp = false
		phoneOverlay.visible = true
		healthText.visible = true
		debtText.visible = true
		animPlayer.play("Bring Down")

func SacrificeHealth():
	if Input.is_action_just_pressed("Sacrifice") and phoneUp:
		soundPlayer.stream = sacrificeSound
		soundPlayer.play()
		globals.health -= 25
		globals.debt -= 2000000
		healthText.text = "Vitality: " + str(globals.health)
		debtText.text = "Debt: " + str(globals.debt)
