extends Control

export(String) var CurrentChapter = "Library/Chapter 1"
export(int) var CurrentIndex = 0
var body;
onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	body = get_node(CurrentChapter)
	showText()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func showText():
	show()
	$Container/Speaker.text = body.Dialogue[CurrentIndex].Speaker
	$Container/Body.bbcode_text = body.Dialogue[CurrentIndex].Content
	tween.interpolate_property($Container/Body, "percent_visible",
	0, 1, $Container/Body.text.length() / 80, Tween.TRANS_LINEAR, Tween.TRANS_LINEAR)
	tween.start()
	
func _on_Body_gui_input(event):
	body = get_node(CurrentChapter)
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.is_pressed():
			if tween.is_active():
				tween.stop($Container/Body, "percent_visible")
				tween.set_active(false)
				$Container/Body.percent_visible = 1
			else:
				if CurrentIndex < body.Dialogue.size() - 1:
					CurrentIndex += 1
					showText()
				elif CurrentIndex == body.Dialogue.size() - 1:
					hide()
					emit_signal("dialogue_terminated")
