extends Node
var ID: String
var Username: String
var Password: String
var Opp: String
var RPS = preload("res://control.tscn")

func Battle(id):
	Opp = id
	#check if other person connects
	get_tree().root.add_child(RPS)
	
