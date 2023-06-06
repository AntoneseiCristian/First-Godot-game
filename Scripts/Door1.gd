extends Interactable
@onready var animation_player = $AnimationPlayer
@onready var sounds_door = $"Sounds Door"
@export var isLocked :=false
@export_node_path("Area3D") var keyPath
var actualKey

var isOpen := false
var canInteract := true

func _ready():
	if keyPath != null:
		actualKey = get_node(keyPath)

func action_use():
	if isLocked and !is_instance_valid(actualKey):
		isLocked = false
	
	
	if !isLocked:
		if canInteract == true:
			if isOpen:
				close()
			else:
				open()
	else:
		animation_player.play("locked_door")

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
