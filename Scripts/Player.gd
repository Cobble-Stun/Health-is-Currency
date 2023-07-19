extends CharacterBody2D

@onready var camera = $Camera2D
@onready var playerSprite = $AnimatedSprite2D
const SPEED = 450.0


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

	move_and_slide()
