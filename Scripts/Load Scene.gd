extends Area2D

@export var scenePath: PackedScene

func _on_body_entered(body):
	if body.name == "Player":
		get_tree().unload_current_scene()
		get_tree().change_scene_to_packed(scenePath)
	
