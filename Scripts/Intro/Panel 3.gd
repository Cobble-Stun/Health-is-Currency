extends Sprite2D

@onready var panels = get_parent().get_node("Panels")
@onready var animationPlayer = $AnimationPlayer
var triggered = false

func _ready():
	self.visible = false
func _process(_delta):
	if panels.count == 2 and triggered == false:
		triggered = true
		self.visible = true
		animationPlayer.play("Unhidden")
		await animationPlayer.animation_finished
		animationPlayer.pause()
