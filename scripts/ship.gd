# script: ship

extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var motion = (get_global_mouse_position().x - position.x) * 0.2
	translate(Vector2(motion, 0))

	# clamping to view
	var view_size = get_viewport_rect().size
	var pos = position
	pos.x = clamp(pos.x, 0+16, view_size.x-16)
	set_position(pos)
