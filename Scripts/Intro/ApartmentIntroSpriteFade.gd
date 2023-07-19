extends Sprite2D

@onready var timer = $Timer

func _ready():
	timer.start()
	await timer.timeout
	self.visible = false
