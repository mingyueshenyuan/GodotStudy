extends Node

@onready var score_label = $ScoreLabel

var score=0

func addPoint():
	score+=1
	score_label.text="点数添加"+str(score)
	print("点数添加"+str(score))
