extends CanvasLayer


func _on_button_button_down():
	Input.action_press("jump")


func _on_button_button_up():
	Input.action_release("jump")
