extends Interactable
@onready var animation_player = $AnimationPlayer

var isOpen := false
var canInteract := true

func action_use():
	if isOpen:
		close()
	else:
		open()

func close():
	animation_player.play("door_closed")
	isOpen = false
	
	
func open():
	animation_player.play("door_open")
	isOpen = true
	
	
