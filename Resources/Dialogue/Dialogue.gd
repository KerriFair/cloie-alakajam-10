extends Control

export(String) var CurrentChapter = "Library/Chapter 1"
export(int) var CurrentIndex = 0
var body;

# Called when the node enters the scene tree for the first time.
func _ready():
	body = get_node(CurrentChapter)
	showText()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func showText():
	show()
	$Container/Body.bbcode_text = body.Dialogue[CurrentIndex].Content

func _on_Body_gui_input(event):
	body = get_node(CurrentChapter)
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			if CurrentIndex < body.Dialogue.size() - 1:
				CurrentIndex += 1
				showText()
			elif CurrentIndex == body.Dialogue.size() - 1:
				hide()
				emit_signal("dialogue_terminated")
