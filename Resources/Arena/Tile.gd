extends Spatial
class_name Tile

var tileType = Threat.Threats.NONE
var isChangable = true
var isPassable = true
var isDamaging = false

func _init():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

# tiles can change sometimes
func setTileType(type):
	if not isChangable:
		 return
	if tileType == type:
		return
		
	var props = $Threat.determineProperties(type)
	isPassable = props[0]
	isDamaging = props[1]
	tileType = type


# do some damage or let pass i guess
func onPlayerEnter(_player):
	pass
