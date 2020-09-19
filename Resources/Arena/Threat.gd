extends MeshInstance
class_name Threat

enum Threats {NONE, LASER, WALL, HOLE}

func _ready():
	pass

func determineProperties(type):
	var isPassable
	var isDamaging
	
	if type == Threats.NONE:
		isPassable = true
		isDamaging = false
	if type == Threats.LASER or type == Threats.HOLE:
		isPassable = false
		isDamaging = true
	if type == Threats.WALL:
		isPassable = false
		isDamaging = false
		
	return [isPassable, isDamaging]
