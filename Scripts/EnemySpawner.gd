extends Node

@export var enemyInstance: PackedScene

func _ready():
	for civilian in globals.civilianAmount:
		var enemy = enemyInstance.instantiate()
		enemy.position = Vector2(randf_range(-2600, 2600), 0)
		add_child(enemy)
