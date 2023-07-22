extends CharacterBody2D

enum {
	Idle, 
	Walking, 
	Dead
}
var state = Idle
var canSacrifice = false
var dead = false
var timerStarted = false
var rndState
var rndWalkLocation: float

var sacrificeSound = preload("res://Sounds/Soul Sacrifice.wav")

@onready var soundPlayer = get_node("/root/Street/Player/AudioStreamPlayer")
@onready var timer = $Timer
@onready var sprite = $AnimatedSprite2D
@onready var text = $"Sacrifice Text"
	
func _process(delta):
	StateMachine(delta)
	SacrificeSelf()
	DecideTypeOfMovement()
	move_and_slide()
	
func DecideTypeOfMovement():
	if timerStarted == false and dead != true:
		timerStarted = true
		rndState = randi_range(1, 2)
		timer.start()
		await timer.timeout
		timer.stop()
		timerStarted = false
		if rndState == 1:
			state = Idle
		elif rndState == 2:
			state = Walking
			rndWalkLocation = randf_range(-150, 150)
			
func StateMachine(delta):
	match state:
		Idle:
			sprite.play("Idle")
		Walking:
			self.position = self.position.lerp(Vector2(self.position.x + rndWalkLocation, self.position.y), 4 * delta)
			sprite.play("Walking")
		Dead:
			dead = true
			sprite.play("Dead")
			text.visible = false
			
	if rndWalkLocation > 0:
		sprite.flip_h = false
	elif rndWalkLocation < 0:
		sprite.flip_h = true
		
func SacrificeSelf():
	if Input.is_action_just_pressed("Sacrifice") and canSacrifice and !dead:
		soundPlayer.stream = sacrificeSound
		soundPlayer.play()
		globals.civilianAmount -= 1
		globals.debt -= 1000000
		rndState = 0
		rndWalkLocation = 0
		state = Dead

func _on_check_player_body_entered(body):
	if body.name == "Player":
		text.visible = true
		canSacrifice = true

func _on_check_player_body_exited(body):
	if body.name == "Player":
		text.visible = false
		canSacrifice = false
