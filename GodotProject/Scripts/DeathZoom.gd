extends Area2D

@onready var timer = $Timer
const timeScale=0.2
func _on_body_entered(body):
	print("你死了")
	Engine.time_scale=timeScale
	timer.wait_time*=Engine.time_scale
	timer.start()
	


func _on_timer_timeout():
	Engine.time_scale=1
	get_tree().reload_current_scene()
