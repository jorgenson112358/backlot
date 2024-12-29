extends Node

var PlayerSelect = 0
var PlayerCharPath = ""
const PlayerCharPaths = [
	"res://Scenes/Players/TheHuntress.tscn",
	"res://Scenes/Players/Moirynn.tscn",
	"res://Scenes/Players/hamish.tscn"
]

func SetPlayer(x):
	PlayerSelect = x
	PlayerCharPath = PlayerCharPaths[x]


#@onready var points_label = %PointsLabel
#@export var hearts: Array[Node]
#
#var points = 0
#var lives = 3
#
#func decrease_lives():
	#lives -= 1
	#print("Lives left -> " + str(lives))
	#for h in 3:
		#if (h < lives):
			#hearts[h].show()
		#else:
			#hearts[h].hide()
	#if (lives == 0):
		#get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
#
#func get_lives():
	#return lives
#
#func add_points():
	#points += 1
	##print(points)
	#points_label.text = "Points: " + str(points)
