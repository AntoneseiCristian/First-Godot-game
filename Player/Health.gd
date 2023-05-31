extends Node3D


signal dead 
signal hurted
signal healed
signal health_changed
signal gibbed

@export var max_health = 100
var cur_health = 1

@export var gib_at = 0

func _ready():
	_init()
	
func _init():
	cur_health = max_health
	emit_signal("health_changed", cur_health)
	
func hurt(damage: int): #damage_type = "normal"):
	if cur_health <= 0:
		return
	cur_health -= damage
	if cur_health <= gib_at:
		pass
		emit_signal("gibbed")
	if cur_health <= 0:
		emit_signal("dead")
	else:
		emit_signal("hurted")
	emit_signal("health_changed", cur_health)
	print(cur_health)
	
func heal(amount:int):
	if cur_health <= 0:
		return
	cur_health += amount
	if cur_health > max_health:
		cur_health = max_health
	emit_signal("healed")
	emit_signal("health_changed", cur_health)
