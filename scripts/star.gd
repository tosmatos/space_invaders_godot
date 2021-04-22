# script : star

extends Sprite

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)
	
	if get_position().y >= get_viewport_rect().size.y+90:
		set_position(Vector2(90, -90))
	pass
