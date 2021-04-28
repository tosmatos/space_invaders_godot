# script: enemy_clever

extends "res://scripts/enemy.gd"

const scn_laser = preload("res://scenes/laser_enemy.tscn")

func choose(choises):
	randomize()
	var rand_index = randi() % choises.size()
	return choises[rand_index]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	get_node("AnimatedSprite").frame = randi() % 3
	velocity.x = choose([velocity.x, -velocity.x])
	
	yield(get_tree().create_timer(1), "timeout")
	shoot()

func _process(delta):
	if get_position().x <= 0+16:
		velocity.x = abs(velocity.x)
		
	if get_position().x >= get_viewport_rect().size.x-16:
		velocity.x = -abs(velocity.x)
	pass
	
func shoot():
	while true:
		var laser = scn_laser.instance()
		laser.set_position(get_node("cannon").get_global_position())
		get_tree().get_root().add_child(laser)
		
		yield(get_tree().create_timer(1.5), "timeout")
	
