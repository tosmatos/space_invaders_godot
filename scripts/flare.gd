# script: fade

extends Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("anim").play("fade_out")
	yield(get_node("anim"), "animation_finished")
	queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
