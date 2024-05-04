extends CanvasLayer
var isPressed=false;
@onready var outpos=Vector2.ZERO
@onready var big_joy = $Control/BigJoy
@onready var small_joy = $Control/SmallJoy
@onready var canvas_layer = $"."

func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if event.position.x>get_viewport().size.x*0.5:
				return
			isPressed=true
			outpos=event.position
			big_joy.position=event.position
			print("按下")
		else:
			isPressed=false
			 
func _process(delta):
	if isPressed:
		big_joy.position=outpos
		canvas_layer.offset=Vector2.ZERO
		small_joy.position=big_joy.position+(get_viewport().get_mouse_position()-big_joy.position).limit_length(50)
		var output=(get_viewport().get_mouse_position()-big_joy.position).normalized()
		if output.x>0:
			Input.action_press("move_right", output.x)
			Input.action_press("move_left", 0)
		elif output.x<0:
			Input.action_press("move_left", -output.x)
			Input.action_press("move_right", 0)
		print(output)
	else :
		canvas_layer.offset=Vector2.ONE*999
		Input.action_press("move_left", 0)
		Input.action_press("move_right", 0)
	big_joy.visible=isPressed
	small_joy.visible=isPressed
