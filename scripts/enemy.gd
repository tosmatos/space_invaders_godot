# script: enemy

extends Area2D

export var armor = 2 setget set_armor 
export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	add_to_group("enemy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)
	
	if get_position().y-16 >= get_viewport_rect().size.y:
		queue_free()

func set_armor(new_value):
	armor = new_value
	if armor <= 0: queue_free()
