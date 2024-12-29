extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Climber"):
		if body.isClimbing == false:
			body.isClimbing = true


func _on_body_exited(body):
	if body.is_in_group("Climber"):
		if body.isClimbing == true:
			body.isClimbing = false
