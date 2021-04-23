# script: ship

extends Area2D

const scn_flare = preload("res://scenes/flare.tscn")
const scn_laser = preload("res://scenes/laser_ship.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
	yield(get_tree().create_timer(0.5), "timeout")
	shoot()
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

func create_flare(pos):
	var flare = scn_flare.instance()
	flare.global_position = pos
	call("add_child", flare)


func create_laser(pos):
	var laser = scn_laser.instance()
	laser.global_position = pos
	get_tree().get_root().add_child(laser)
	
func shoot():
	while true:
		var pos_left = get_node("cannons/left").get_global_position()
		var pos_right = get_node("cannons/right").get_global_position()
		var pos_flare_left = get_node("cannons/left").get_position()
		var pos_flare_right = get_node("cannons/right").get_position()
		create_laser(pos_left)
		create_flare(pos_flare_left)
		create_laser(pos_right)
		create_flare(pos_flare_right)
		
		yield(get_tree().create_timer(0.25), "timeout")
