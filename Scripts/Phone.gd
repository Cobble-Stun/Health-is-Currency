extends CanvasLayer

var phoneUp = false
@onready var phoneOverlay = $PhoneOverlay
@onready var animPlayer = $PhoneOverlay/AnimationPlayer
@onready var healthText = $PhoneOverlay/Health
@onready var debtText = $PhoneOverlay/Debt

func _ready():
	phoneOverlay.visible = false
	healthText.visible = false
	debtText.visible = false

func _process(_delta):
	if Input.is_action_just_pressed("Phone") and !phoneUp:
		phoneUp = true
		phoneOverlay.visible = true
		healthText.visible = true
		debtText.visible = true
		healthText.text = str(globals.health)
		debtText.text = str(globals.debt)
		animPlayer.play("Bring Up")
	elif Input.is_action_just_pressed("Phone") and phoneUp:
		phoneUp = false
		phoneOverlay.visible = true
		healthText.visible = true
		debtText.visible = true
		healthText.text = str(globals.health)
		debtText.text = str(globals.debt)
		animPlayer.play("Bring Down")
		
		
