extends Spatial
class_name Character

export(bool) var isFriendly

func _ready():
	if isFriendly:
		$avatar.mesh.surface_get_material(0).albedo_color = Color(0, 0.8, 1, 0.5)
	else:
		$avatar.mesh.surface_get_material(0).albedo_color = Color(1, 0, 0, 0.5) 
