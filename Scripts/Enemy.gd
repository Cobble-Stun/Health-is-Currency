extends CharacterBody2D

enum {
	Idle, 
	Walking, 
	Attacking
}
var state = Idle
var timerStarted = false
var rndState
var rndWalkLocation: float

@onready var timer = $Timer
@onready var sprite = $AnimatedSprite2D

func _ready():
	pass
	
func _process(delta):
	StateMachine(delta)
	DecideTypeOfMovement()
	move_and_slide()
	
func DecideTypeOfMovement():
	if timerStarted == false:
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
			pass
		Walking:
			self.position = self.position.lerp(Vector2(self.position.x + rndWalkLocation, self.position.y), 4 * delta)
		Attacking:
			pass
			
	if rndWalkLocation > 0:
		sprite.flip_h = false
	elif rndWalkLocation < 0:
		sprite.flip_h = true
