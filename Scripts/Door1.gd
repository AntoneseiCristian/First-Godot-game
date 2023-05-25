extends Interactable
@onready var animation_player = $AnimationPlayer

var isOpen := false
var canInteract := true

func action_use():
	if canInteract == true:
		if isOpen:
			close()
		else:
			open()

func close():
	animation_player.play("door_closed")
	isOpen = false
	canInteract = false
	
	
func open():
	animation_player.play("door_open")
	isOpen = true
	canInteract = false
	
	


func _on_animation_player_animation_finished(anim_name):
	canInteract = true
