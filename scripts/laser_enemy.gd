# script: laser_enemy

extends "res://scripts/laser.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("area_entered", self, "_on_area_entered")
	pass #

func _on_area_entered(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		create_flare()
		queue_free()
