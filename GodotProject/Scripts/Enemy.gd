extends Node2D


@onready var ray_cast_2d_l = $RayCast2D_L
@onready var ray_cast_2d_r = $RayCast2D_R
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPEED=60
var direction=1;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_2d_l.is_colliding():
		direction=1
		animated_sprite_2d.flip_h=false
	if ray_cast_2d_r.is_colliding():
		direction=-1
		animated_sprite_2d.flip_h=true
	position.x+=delta*SPEED*direction
