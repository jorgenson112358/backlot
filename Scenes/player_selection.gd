extends Node2D

var playerCharactersLength = Globals.PlayerCharPaths.size()
var currentPlayerNum = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match currentPlayerNum:
		0:
			get_node("PlayerSelect").play("Player0")
			get_node("CharacterDesc").text = "The Huntress, a mysterious spear thrower"
		1:
			get_node("PlayerSelect").play("Player1")
			get_node("CharacterDesc").text = "Moirynn the Bold, a swordswoman with multiple attacks"
		2:
			get_node("PlayerSelect").play("Player2")
			get_node("CharacterDesc").text = "Hamish the Brawler, small but mighty"

func _on_button_left_pressed():
	if (currentPlayerNum == 0):
		currentPlayerNum = playerCharactersLength - 1
	else:
		currentPlayerNum -= 1
		
	print("left scroll =" + str(currentPlayerNum))


func _on_button_right_pressed():
	if (currentPlayerNum == (playerCharactersLength - 1) ):
		currentPlayerNum = 0
	else:
		currentPlayerNum += 1
		
	print("right scroll =" + str(currentPlayerNum))


func _on_button_select_pressed():
	Globals.SetPlayer(currentPlayerNum)
	print("selected char")
	get_tree().change_scene_to_file("res://Scenes/Levels/Pyramid.tscn")
