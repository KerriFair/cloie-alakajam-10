extends Spatial
class_name Map

export(int) var width = 1
export(int) var length = 1

var _tile = preload("res://Resources/Arena/Tile.tscn")

func _ready():
	generateMap()

func generateMap():
	print("Generating...")
	for _w in range(width):
		for _l in range(length):
			print("Add child")
			add_child(_tile.instance())
			# some sort of math to make this a grid and not overlapping
