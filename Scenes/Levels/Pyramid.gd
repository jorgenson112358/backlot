extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerCharPath = Globals.PlayerCharPath
	var playerNode = load(playerCharPath).instantiate()
	playerNode.set_name("PlayerCharacter")
	add_child(playerNode)
	playerNode.global_position = get_node("StartLocation").position
